require 'spec_helper'

describe Spree::Promotion::Rules::UserUsageLimit do
  let(:user) { create(:user) }
  let(:promotion) { create(:promotion) }
  let(:rule) { Spree::Promotion::Rules::UserUsageLimit.create }

  before do
    promotion.rules << rule
    promotion.actions << Spree::Promotion::Actions::CreateAdjustment.new
  end

  describe "#applicable?" do
    context "with an order" do
      let(:order) { mock_model(Spree::Order, :user => nil, :email => nil) }

      it { rule.should be_applicable(order) }
    end

    context "with a promotion" do
      it { rule.should_not be_applicable(promotion) }
    end
  end

  context "without a user or guest email" do
    let(:order) { mock_model(Spree::Order, :user => nil, :email => nil) }

    it { rule.should_not be_eligible(order) }
  end

  context "for a signed user" do
    context "with no completed orders" do
      let(:order) { mock_model(Spree::Order, :user => user) }

      it { rule.should be_eligible(order) }
    end

    context "with a completed order" do
      let(:order) { create(:completed_order_with_totals, user: user) }

      context "that didn't use the promo" do
        it { rule.should be_eligible(order) }
      end

      context "that used the promo" do
        before { create(:adjustment, adjustable: order, source: order, originator: promotion.actions.first) }

        it { rule.should_not be_eligible(order) }
      end
    end

    context "with an incomplete order that used the promo" do
      let(:order) { create(:order_with_totals, user: user) }
      before { create(:adjustment, adjustable: order, source: order, originator: promotion.actions.first) }

      it { rule.should be_eligible(order) }
    end
  end

  context "for a guest user" do
    let(:email) { 'user@spreecommerce.com' }
    let(:order) { create(:completed_order_with_totals, email: email) }

    context "with no other orders" do
      it { rule.should be_eligible(order) }
    end

    context "with another order" do
      before { create(:adjustment, adjustable: order, source: order, originator: promotion.actions.first) }

      it { rule.should_not be_eligible(order) }
    end
  end
end
