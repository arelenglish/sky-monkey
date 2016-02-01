require 'rails_helper'

RSpec.describe BoardingPass, type: :model do
  subject(:boarding_pass) do
    BoardingPass.new(
    id: 12,
    price: 75,
    quantity: 2,
    tax_paid: 8.875,
    is_valid: true
    )
  end

  describe "#grand_total" do
    it "returns the total amount due with tax" do
      expect(boarding_pass.grand_total).to eq(163.31250000000003)
    end
  end

  describe "#generate_qrcode" do
    it "saves a QR code in /public" do
      boarding_pass.generate_qrcode
      expect(Dir.entries('./public/boarding_passes/').include?('boarding_pass12.png')).to be(true)
      FileUtils.rm('./public/boarding_passes/boarding_pass12.png')
    end
  end

  describe "#mark_invalid" do
    it "changes a boarding pass status to invalid" do
      expect(boarding_pass.is_valid).to eq(true)
      boarding_pass.mark_invalid
      expect(boarding_pass.is_valid).to eq(false)
    end
  end

end
