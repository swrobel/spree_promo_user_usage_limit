require 'spec_helper'

describe Spree::Promotion::Rules::UserUsageLimit do
  let(:promotion) { create(:promotion) }
  let(:rule) { Spree::Promotion::Rules::UserUsageLimit.create(promotion: promotion) }

  context "#eligible?(order)" do
    let(:order) { Spree::Order.new }

    it "should be eligible if the user has not used the promotion before" do
      user = mock_model(Spree::LegacyUser)
      order.stub(:user => user)

      rule.should be_eligible(order)
    end

    it "should not be eligible if the user has used the promotion before" do
      user = mock_model(Spree::LegacyUser)
      order.stub(:user => user)

      rule.should be_eligible(order)
    end
  end
end
