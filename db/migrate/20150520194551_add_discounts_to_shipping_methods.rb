class AddDiscountsToShippingMethods < ActiveRecord::Migration
  def change
    add_column :spree_shipping_methods, :discount, :integer, default: 0
  end
end
