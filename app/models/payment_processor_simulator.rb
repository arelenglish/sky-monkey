class PaymentProcessorSimulator
  include ActiveModel::Model
  attr_accessor :cc_number, :expiration, :cvc

  validates :expiration, presence: true
  validates :cc_number, presence: true, length: { in: 15..16 }
  validates :cvc, presence: true, length: { in: 3..4}

  def valid_card?
    true
  end

  def tokenize(user)
    # Ultra secure credit card hash - add all three values together.
    token = @cc_number + @expiration + @cvc
    user.update_attributes(cc_token: token)
  end

end
