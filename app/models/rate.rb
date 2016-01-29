class Rate < ActiveRecord::Base
  validates :active_date, uniqueness: true
  validates :price, presence: true

  def self.last_tax_rate
    if last_rate = where.not(tax_rate: nil).last
      last_rate.tax_rate
    else
      10.0
    end
  end

  def self.todays_price
    if daily_rate = find_by(active_date: Time.now.utc.beginning_of_day)
      daily_rate.price
    else
      75
    end
  end

  def self.todays_tax_rate
    if daily_rate = find_by(active_date: Time.now.utc.beginning_of_day)
      daily_rate.tax_rate
    else
      8.875
    end
  end
end
