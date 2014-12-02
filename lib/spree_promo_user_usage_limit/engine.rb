module SpreePromoUserUsageLimit
  class Engine < Rails::Engine
    require 'spree/core'
    require 'spree/promo'
    isolate_namespace Spree
    engine_name 'spree_promo_user_usage_limit'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

    # We need to define promotions rules here so extensions and existing apps
    # can add their custom classes on their initializer files
    initializer 'spree.promo.environment', :after => 'spree.environment' do |app|
      app.config.spree.add_class('promotions')
      app.config.spree.promotions = Spree::Promo::Environment.new
      app.config.spree.promotions.rules = []
    end

    initializer "spree_promo_user_usage_limit.register.promotion_rules" do |app|
      app.config.spree.promotions.rules << Spree::Promotion::Rules::UserUsageLimit

    end
  end
end
