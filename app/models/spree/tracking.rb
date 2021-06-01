module Spree
  class Tracking < Spree::Base
    # Associations
    belongs_to :user, required: true

    # Ransackable Attributes
    self.whitelisted_ransackable_attributes = %w[created_at entity_errors entity_type flash response_code
                                                 request_parameters]
    self.whitelisted_ransackable_associations = %w[user]
    self.whitelisted_ransackable_scopes = %w[request_parameters_contains flash_message_contains controller_contains
                                             action_type entity_id_eq]

    def self.request_parameters_contains(query)
      where("request_parameters::TEXT ilike '%#{query}%'")
    end

    def self.flash_message_contains(query)
      where("flash::TEXT ilike '%#{query}%'")
    end

    def self.controller_contains(query)
      where("request_parameters::TEXT ilike '%#{query}%'")
    end

    def self.action_type(query)
      where("request_parameters->>'action' = '#{query}'")
    end

    def self.entity_id_eq(query)
      where("request_parameters->>'id' = '#{query}'")
    end

    # Instance Methods
    def entity_errors
      @entity_errors ||= ActiveSupport::HashWithIndifferentAccess.new(super)
    end

    def flash
      @flash ||= ActiveSupport::HashWithIndifferentAccess.new(super)
    end

    def request_parameters
      @request_parameters ||= ActiveSupport::HashWithIndifferentAccess.new(super)
    end

    def updated_parameters
      @updated_parameters ||= ActiveSupport::HashWithIndifferentAccess.new(super)
    end

    def entity_id
      @entity_id ||= request_parameters[:id] || 'None'
    end

    def controller
      @controller ||= request_parameters[:controller]&.gsub('spree/', '')
    end

    def action
      @action ||= request_parameters[:action]
    end

    def failed_request?
      entity_errors.present? || flash[:error].present?
    end
  end
end
