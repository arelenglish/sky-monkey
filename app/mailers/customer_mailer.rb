class CustomerMailer < ApplicationMailer

  def boarding_pass(customer)
    @customer = customer
    mail(from: 'boarding.pass@skymonkey.com', to: @customer.email, subject: 'Your Sky Monkey Boarding Pass')
    @qr = @customer.boarding_passes.last.generate_qrcode
    @qr.as_png.save('boarding_pass.png')
    attachments['boarding_pass.jpg'] = File.read('./boarding_pass.png')
  end

end
