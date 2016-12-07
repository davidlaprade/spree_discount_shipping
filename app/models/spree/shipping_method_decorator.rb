Spree::ShippingMethod.class_eval do
  attr_accessible :discount

  DEFAULT_AMOUNT = 10.0

  def compute_amount(calculable)
    original = self.calculator.compute(calculable)
    discount = (100 - (self.discount || 0))/100.0 rescue 1
    original * discount
  rescue
    Rails.logger.error "Spree::ShippingMethod COMPUTE ERROR for " +
      "#{self.class} ##{self.id}, with calculable: " +
      "#{calculable.class} ##{calculable.id}. " +
      "Using default amount #{DEFAULT_AMOUNT}"
    DEFAULT_AMOUNT
  end
end
