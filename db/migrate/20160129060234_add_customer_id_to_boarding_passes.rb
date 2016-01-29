class AddCustomerIdToBoardingPasses < ActiveRecord::Migration
  def change
    add_column :boarding_passes, :customer_id, :integer
  end
end
