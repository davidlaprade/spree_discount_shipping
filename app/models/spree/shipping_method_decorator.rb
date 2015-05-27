Spree::ShippingMethod.class_eval do
  attr_accessible :discount

  def compute_amount(calculable)
    self.calculator.compute(calculable) * (100 - (self.discount || 0))/100.0
  end
end
