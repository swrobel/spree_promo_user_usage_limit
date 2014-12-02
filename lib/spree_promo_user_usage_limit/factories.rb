FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_promo_user_usage_limit/factories'

  factory :promotion, :class => Spree::Promotion, :parent => :activator do
    name 'Promo'
  end

  factory :order_with_totals_custom, :class => Spree::Order do
    association(:user, :factory => :user)
    email 'foo@example.com'
    bill_address { FactoryGirl.create(:address) }
    ship_address { FactoryGirl.create(:address) }
    line_items { [FactoryGirl.create(:line_item)] }
  end

  factory :completed_order_with_totals_custom, :class => Spree::Order do
    association(:user, :factory => :user)
    email 'foo@example.com'
    bill_address { FactoryGirl.create(:address) }
    ship_address { FactoryGirl.create(:address) }
    line_items { [FactoryGirl.create(:line_item)] }
    # inventory_units { [FactoryGirl.create(:inventory_unit, :state => 'shipped')] }
    state 'complete'
    completed_at Time.now
  end

  factory :adjustment_custom, :class => Spree::Adjustment do
    adjustable { FactoryGirl.create(:order) }
    amount '100.0'
    label 'Shipping'
    # source { FactoryGirl.create(:shipment) }
    eligible true
  end

end
