require 'rails_helper'

RSpec.describe BoardingPassesController, type: :controller do
  let(:valid_attributes) {{
    quantity: 3,
    price: 65,
    expiration: Time.now.utc.beginning_of_day + 14.days,
    tax_paid:8.875
  }}

  describe "GET new" do
    it "assigns a new boarding_pass as @boarding_pass" do
      get :new, {}
      expect(assigns(:boarding_pass)).to be_a_new(BoardingPass)
      expect(session[:boarding_pass]).to eq({})
    end
  end

  describe "POST create" do
    it "assigns a newly created boarding_pass as @boarding_pass" do
      post :create, {boarding_pass: valid_attributes}
      expect(assigns(:boarding_pass)).to be_a(BoardingPass)
    end

    it "redirects to the new new payment form" do
      post :create, {boarding_pass: valid_attributes}
      expect(response).to redirect_to(:new_payment)
    end

    it "adds the boarding pass to the session" do
      post :create, {boarding_pass: valid_attributes}
      expect(session[:boarding_pass]['price']).to eq(65.0)
    end
  end

end
