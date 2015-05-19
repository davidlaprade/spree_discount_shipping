require 'spec_helper'

describe 'shipping method config in spree admin', js: true do

  let(:admin) { FactoryGirl.create(:admin_user) }

  before (:each) do
    login_spree(admin)
    visit spree.new_admin_shipping_method_path
    expect(page).to have_content("New Shipping Method")
  end

  it 'should allow admin to set discount through GUI' do
    fill_in 'Name', :with => 'Test Shipping Method'
    fill_in 'discount %', :with => 45
    click_button 'Create'
    
    expect(page).to have_content("has been successfully created")
    expect(Spree::ShippingMethod.last.discount).to eq(45)
  end

end