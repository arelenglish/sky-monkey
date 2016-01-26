class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true
end
