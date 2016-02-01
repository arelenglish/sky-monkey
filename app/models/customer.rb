class Customer < ActiveRecord::Base
  has_many :boarding_passes
  validates :name, presence: true
  # email: true is a custom validator
  validates :email, presence: true, email: true

  def add_token(payment_processor_simulator)
    token = payment_processor_simulator.tokenize
    update_attributes(cc_token: token)
  end

end
