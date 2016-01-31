class PaymentProcessorSimulator
  include ActiveModel::Model
  attr_accessor :cc_number, :expiration, :cvc

  validates :expiration, presence: true
  validates :cc_number, presence: true, length: { in: 15..16 }
  validates :cvc, presence: true, length: { in: 3..4}
  validate :expiration_date_cannot_be_in_the_past

  # This is where the card gets charged as well
  def valid_card?
    true
  end

  def tokenize
    # Ultra secure credit card hash - add all three values together.
    token = @cc_number + @expiration + @cvc
  end

  def add_customer_token(customer)
    token = tokenize
    customer.update_attributes(cc_token: token)
  end

  def last_four
    cc_number.split(//).last(4).join
  end

private
  def expiration_date_cannot_be_in_the_past
    if expiration.blank? || Date.new(expiration.to_i) < Date.today.beginning_of_month
      errors.add(:expiration, "can't be in the past")
    end
  end

end
