class Customer < ActiveRecord::Base
  validates :name, presence: true
  # email: true is a custom validator
  validates :email, presence: true, email: true
end
