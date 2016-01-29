class BoardingPass < ActiveRecord::Base
  belongs_to :customer
  def self.grand_total(tkt_qty, price, tax_rate)
    (price.to_f * tkt_qty.to_i) * (1 + tax_rate.to_f/100)
  end
end
