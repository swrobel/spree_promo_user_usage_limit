class AddPreferredUsesToPromotionRules < ActiveRecord::Migration
  def change
    add_column :spree_promotion_rules, :preferred_uses, :integer, default: 1
  end
end
