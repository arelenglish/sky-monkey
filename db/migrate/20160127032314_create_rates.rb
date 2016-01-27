class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.float :price
      t.datetime :active_date

      t.timestamps null: false
    end
  end
end
