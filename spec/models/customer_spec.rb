require 'rails_helper'

RSpec.describe PaymentProcessorSimulator, type: :model do
  subject(:customer) do
    Customer.new(name:'Arel', email:'arel@skymonkey.com')
  end

  subject(:payment_processor_simulator) do
    PaymentProcessorSimulator.new({
      cc_number:'123454545454543',
      expiration:'2014, july',
      cvc:'123'})
  end

  describe "#add_token(payment_processor_simulator)" do
    it "adds tokenized version of cc num to customer" do
      expect(customer.add_token(payment_processor_simulator))
    end
  end

end
