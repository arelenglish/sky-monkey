class BoardingPass < ActiveRecord::Base
  require 'rqrcode'

  after_create :send_pass_email

  belongs_to :customer

  def self.grand_total(tkt_qty, price, tax_rate)
    (price.to_f * tkt_qty.to_i) * (1 + tax_rate.to_f/100)
  end

  def generate_code
    code = "quantity:#{self.quantity}, expriation:#{self.expiration}, valid:#{self.is_valid}"
    qr = RQRCode::QRCode.new(code)
    qr.as_png.save("./public/boarding_passes/boarding_pass#{self.id}.png")
  end

  def send_pass_email
    CustomerMailer.boarding_pass(self.customer)
  end

  def mark_invalid
    self.update(is_valid: false)
  end
end
