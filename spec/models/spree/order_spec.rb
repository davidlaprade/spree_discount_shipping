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

    # create and stub out shipping methods to avoid having to set Spree::Zones, display_on, etc
    5.times { create :shipping_method, discount: rand(100) }
    Spree::ShippingMethod.any_instance.stub(:available_to_order?).and_return(true)

    order.rate_hash.each do |rate|
      ship_method = rate.shipping_method
      calculated_cost = ship_method.calculator.compute(order) * (100 - ship_method.discount)/100.0
      expect( calculated_cost ).to eq( rate.cost )
    end
  end

end