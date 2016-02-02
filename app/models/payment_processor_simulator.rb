class PaymentProcessorSimulator
  include ActiveModel::Validations
  attr_reader   :customer
  attr_accessor :cc_number, :expiration, :cvc, :success, :error

  def initialize(payment_params: {}, customer: nil)
    @cvc = payment_params['cvc']
    @cc_number = payment_params['cc_number']
    @expiration = payment_params['expiration']
    @customer = customer
  end

  validates :expiration, presence: true
  validates :cc_number, presence: true, length: { in: 15..16 }
  validates :cvc, presence: true, length: { in: 3..4}
  validate :expiration_date_cannot_be_in_the_past

  def valid_card?
    true
  end

  def tokenize
    # Ultra secure credit card hash - add all three values together.
    token = @cc_number.to_s + @expiration + @cvc.to_s
  end

  def last_four
    cc_number.split(//).last(4).join
  end

  def execute
    if valid_card?
      self.success = true
      customer.add_token(tokenize)
    else
      self.error = 'Credit Card not valid.'
    end
    self
  end

  def success?
    success
  end

private
  def expiration_date_cannot_be_in_the_past
    if expiration.blank? || Date.new(expiration.to_i) < Date.today.beginning_of_month
      errors.add(:expiration, "can't be in the past")
    end
  end

end
