require 'rails_helper'

RSpec.describe PaymentProcessorSimulator, type: :model do
  subject(:customer) do
    Customer.new(name:'Arel', email:'arel@skymonkey.com')
  end

  subject(:payment_processor_simulator) do
    PaymentProcessorSimulator.new(payment_params:{
        cc_number: "123456789876543",
        expiration: "2020-06",
        cvc: "123"
      })
  end

  describe "#add_token(payment_processor_simulator)" do
    it "adds tokenized version of cc num to customer" do
      expect(customer.add_token(payment_processor_simulator))
    end
  end

end
