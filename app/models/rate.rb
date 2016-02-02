class Rate < ActiveRecord::Base
  validates :active_date, uniqueness: true
  validates :price, presence: true

  def self.last_tax_rate
    where.not(tax_rate: nil).last.try(:tax_rate) || 8.875
  end

  def self.todays_price
    find_by(active_date: Time.now.utc.beginning_of_day).try(:price) || 75
  end

  def self.todays_tax_rate
    find_by(active_date: Time.now.utc.beginning_of_day).try(:tax_rate) || 8.875
  end
end
