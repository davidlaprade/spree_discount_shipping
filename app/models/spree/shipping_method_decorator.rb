Spree::ShippingMethod.class_eval do
  attr_accessible :discount

  def compute_amount(calculable)
    original = self.calculator.compute(calculable)
    discount = (100 - (self.discount || 0))/100.0 rescue 1
    original * discount
  end
end
