require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let(:valid_attributes) {{
    name: "Arel",
    email: "arel@skymonkey.com"
  }}

  describe "GET new" do
    it "assigns a new customer as @customer" do
      get :new, {}
      expect(assigns(:customer)).to be_a_new(Customer)
      expect(session[:customer]).to eq({})
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "assigns a newly created customer as @customer" do
        post :create, {customer: valid_attributes}
        expect(assigns(:customer)).to be_a(Customer)
      end

      it "redirects to a new boarding pass form" do
        post :create, {customer: valid_attributes}
        expect(response).to redirect_to(:new_boarding_pass)
      end

      it "adds the customer to the session" do
        post :create, {customer: valid_attributes}
        expect(session[:customer]['name']).to eq('Arel')
      end
    end

    context "with invalid params" do
      it "assignes a newly created but unsaved customer as @customer" do
        post :create, {customer: {"name" => "", "email" => "bob.co"}}
        expect(assigns(:customer)).to be_a_new(Customer)
      end

      it "re-renders the 'new' template" do
        post :create, {customer: {"name" => "", "email" => "bob.co"}}
        expect(response).to render_template("new")
      end
    end
  end

end
