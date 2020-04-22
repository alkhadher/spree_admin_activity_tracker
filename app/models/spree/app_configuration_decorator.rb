module Spree
  module AppConfigurationDecorator
    def self.prepended(base)
      base.preference :admin_trackings_per_page, :integer, default: 45
    end
  end
end
::Spree::AppConfiguration.prepend Spree::AppConfigurationDecorator
