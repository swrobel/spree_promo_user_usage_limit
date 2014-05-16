# A rule to restrict a promotion to N uses per user
module Spree
  class Promotion
    module Rules
      class UserUsageLimit < PromotionRule
        preference :uses, :decimal, default: 1

        def eligible?(order, options = {})
          action_ids = promotion.actions.select(:id).pluck(:id)
          promotion_count = Spree::Adjustment.promotion.where(adjustable_id: Spree::Order.complete.select(:id).where(user_id: order.user.id).pluck(:id)).where(originator_id: action_ids).count

          promotion_count < preferred_uses
        end
      end
    end
  end
end
