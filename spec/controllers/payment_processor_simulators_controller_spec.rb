# require 'rails_helper'
#
# RSpec.describe PaymentProcessorSimulator, type: :controller do
#   let(:valid_attributes) {{
#     expiration: Time.now.utc.beginning_of_day + 1.month,
#     cc_number: "123456789098765",
#     cvc: "123"
#   }}
#
#   describe "GET new" do
#     it "assigns a new payment_processor as @payment" do
#       get :new, {}
#       expect(assigns(:payment)).to be_a_new(PaymentProcessorSimulator)
#       expect(session[:payment]).to eq({})
#     end
#   end
#
#   describe "POST create" do
#     it "assigns a newly created payment_processor as @payment" do
#       post :create, {payment: valid_attributes}
#       expect(assigns(:payment)).to be_a(Payment)
#     end
#
#     it "redirects to a new boarding pass form" do
#       post :create, {customer: valid_attributes}
#       expect(response).to redirect_to(:new_boarding_pass)
#     end
#
#     it "adds the boarding pass to the session" do
#       post :create, {customer: valid_attributes}
#       expect(session[:customer]['name']).to eq('Arel')
#     end
#   end
#
# end
