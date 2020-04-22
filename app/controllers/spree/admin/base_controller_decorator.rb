module Spree
  module Admin
    module BaseControllerDecorator
      def self.prepended(base)
        base.include Spree::Trackable
      end
    end
  end
end
::Spree::Admin::BaseController.prepend Spree::Admin::BaseControllerDecorator
