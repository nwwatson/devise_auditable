require 'devise_auditable/hooks/auditable'

module Devise
  module Models
    module Auditable
      NullRequestStruct = Struct.new(:remote_ip, :headers).new.tap do |req|
        req.headers = {}.freeze
      end.freeze

      def audit_login!(request)
        audit! 'login', request
      end

      def audit_logout!(request)
        audit! 'logout', request
      end

      def audit!(action, request = NullRequestStruct)
        "#{self.class.name}Audit".constantize.create({
          action: action,
          action_occured_at: Time.now,
          client_ip: request.remote_ip,
          user_agent: request.headers['User-Agent'],

          self.class.name.foreign_key => self.id
        })
      end
    end
  end
end
