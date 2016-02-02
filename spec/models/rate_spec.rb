require 'rails_helper'

RSpec.describe Rate, type: :model do

  let(:rate){
    Rate.create(price: 12, tax_rate: 12.53, active_date: Time.now.utc.beginning_of_day)
  }

  describe "::last_tax_rate" do
    context "no rates saved" do
      it "returns 8.875" do
        expect(Rate.last_tax_rate).to eq(8.875)
      end
    end

    context "at least one rate saved" do
      it "retuns last tax rate" do
        rate
        expect(Rate.last_tax_rate).to eq(12.53)
        rate.destroy
      end
    end
  end

  describe "::todays_price" do
    context "no price set for today" do
      it "returns 75" do
        expect(Rate.todays_price).to eq(75)
      end
    end

    context "price set for today" do
      it "returns todays price" do
        rate
        expect(Rate.last_tax_rate).to eq(12.53)
        rate.destroy
      end
    end
  end

  describe "::todays_tax_rate" do
    context "no tax rate set for today" do
      it "returns 8.875" do
        expect(Rate.todays_tax_rate).to eq(8.875)
      end
    end

    context "tax rate set for today" do
      it "retuns days tax rate" do
        rate
        expect(Rate.todays_tax_rate).to eq(12.53)
        rate.destroy
      end
    end
  end

end
