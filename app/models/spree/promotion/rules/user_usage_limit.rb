# A rule to restrict a promotion to N uses per user
module Spree
  class Promotion
    module Rules
      class UserUsageLimit < PromotionRule
        preference :uses, :integer, default: 1

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          if order.user
            order_ids = order.user.orders.complete.pluck(:id)
          elsif order.email
            order_ids = Spree::Order.complete.where(email: order.email).pluck(:id)
          else # user or email required to check against previous orders
            return false
          end
          action_ids = promotion.actions.pluck(:id)
          promotion_count = Spree::Adjustment.promotion.where(adjustable_id: order_ids).where(originator_id: action_ids).count

          promotion_count < preferred_uses
        end
      end
    end
  end
end
