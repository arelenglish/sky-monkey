class BoardingPass < ActiveRecord::Base
  require 'rqrcode'

  after_create :send_pass_email

  belongs_to :customer

  def grand_total
    (price.to_f * quantity.to_i) * (1 + tax_paid.to_f/100)
  end

  def generate_qrcode
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
