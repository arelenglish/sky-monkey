class Customer < ActiveRecord::Base
  has_many :boarding_passes
  validates :name, presence: true
  # email: true is a custom validator
  validates :email, presence: true, email: true

  def add_token(token)
    update_attributes(cc_token: token)
  end

end
