require 'rails_helper'

RSpec.describe PaymentProcessorSimulator, type: :model do
  subject(:payment_processor_simulator) do
    PaymentProcessorSimulator.new(
      cc_number:'123454545454543',
      expiration:'2014, july',
      cvc:'123')
  end

  describe "#valid_card?" do
    it "returns true" do
      expect(payment_processor_simulator.valid_card?).to eq(true)
    end
  end

  describe "#tokenize" do
    it "creates a token from the card fields" do
      expect(payment_processor_simulator.tokenize).to eq('1234545454545432014, july123')
    end
  end

  describe "#last_four" do
    it "returns last four digits of cc num" do
      expect(payment_processor_simulator.last_four).to eq('4543')
    end
  end

end
