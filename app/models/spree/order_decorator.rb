Spree::Order.class_eval do
  
  # UPGRADE_CHECK
  # https://github.com/spree/spree/blob/7d19c8933042cec667634c8cffedcbe6084abf1d/core/app/models/spree/order.rb#L423-L432
  # apply the the Spree::ShippingMethod's discount to the estimated shipping cost
  def rate_hash
    @rate_hash ||= available_shipping_methods.collect do |ship_method|
      cost = ship_method.calculator.compute(self) rescue nil
      next unless cost
      Spree::ShippingRate.new( :id => ship_method.id,
                        :shipping_method => ship_method,
                        :name => ship_method.name,
                        :cost => cost * (100 - (ship_method.discount || 0 rescue 0))/100.0,
                        :currency => currency)
    end.compact.sort_by { |r| r.cost }
  end

end