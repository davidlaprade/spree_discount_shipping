Spree::Core::CalculatedAdjustments.class_eval do

  # UPGRADE_CHECK
  # Calculate the amount to be used when creating an adjustment
  # monkey patches https://github.com/spree/spree/blob/7d19c8933042cec667634c8cffedcbe6084abf1d/core/lib/spree/core/calculated_adjustments.rb#L45-L48
  def compute_amount(calculable)
    amount = self.calculator.compute(calculable)
    if self.is_a? Spree::ShippingMethod
      amount * (100 - (self.discount || 0 rescue 0))/100.0
    else
      amount
    end
  end

end