class AddTaxRateToRate < ActiveRecord::Migration
  def change
    add_column :rates, :tax_rate, :float
  end
end
