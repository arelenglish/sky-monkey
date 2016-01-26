class CreateBoardingPasses < ActiveRecord::Migration
  def change
    create_table :boarding_passes do |t|
      t.float :price
      t.integer :quantity
      t.float :tax_paid
      t.datetime :expiration
      t.boolean :is_valid

      t.timestamps null: false
    end
  end
end
