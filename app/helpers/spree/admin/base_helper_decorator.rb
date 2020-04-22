module Spree
  module Admin
    module BaseHelperDecorator
  def pretty_json(json)
    JSON.pretty_generate(json)
  end
  end
  end
end
::Spree::Admin::BaseHelper.prepend Spree::Admin::BaseHelperDecorator
