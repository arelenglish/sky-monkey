require 'rails_helper'

RSpec.describe PaymentProcessorSimulator, type: :model do
  subject(:payment_processor_simulator) do
    PaymentProcessorSimulator.new(payment_params:{
      "cc_number"=>"123456789876543",
      "expiration"=>"2044, july",
      "cvc"=>"123"})
  end

  describe "#valid_card?" do
    it "returns true" do
      expect(payment_processor_simulator.valid_card?).to eq(true)
    end
  end

  describe "#tokenize" do
    it "creates a token from the card fields" do
      expect(payment_processor_simulator.tokenize).to eq('1234567898765432044, july123')
    end
  end

  describe "#last_four" do
    it "returns last four digits of cc num" do
      expect(payment_processor_simulator.last_four).to eq('6543')
    end
  end

end
