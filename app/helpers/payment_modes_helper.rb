module PaymentModesHelper
  def all_payment_mode
    PaymentMode.all.collect { |x| [x.name, x.id] }
  end
end
