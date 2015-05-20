require 'spec_helper'

describe Spree::Order, :type => :model do

  let(:order) { create :order_with_totals, shipping_address: create(:address) }

  it 'should apply discounts' do
    # double and stub out calculator to avoid making API calls
    calc = double()
    calc.stub(:available?) { |order| true }
    calc.stub(:preferences).and_return({:amount=>0, :currency=>"USD"})
    calc.stub(:compute) { |order| 10.0 }
    Spree::ShippingMethod.any_instance.stub(:calculator).and_return(calc)

    # get shipping rates
    rates = order.rate_hash
    ship_method = rates.first.shipping_method

    # set discount and calculate cost
    expect(ship_method.update_attributes( discount: 45 )).to be true
    calculated_cost = ship_method.calculator.compute(order) * (100 - ship_method.discount)/100.0
    expect( calculated_cost ).to eq( rates.first.cost )
  end

end