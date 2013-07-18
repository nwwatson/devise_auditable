require 'devise_auditable/hooks/auditable'

module Devise
  module Models
    module Auditable
      def audit_login!(request)
        audit!("login", request)
      end

      def audit_logout!(request)
        audit!("logout", request)
      end

      def audit!(action, request)
        Rails.logger.info "The Current Action is: #{action}"
        Rails.logger.info "The Current Time is: #{Time.now}"
        Rails.logger.info "The Current IP is: #{request.remote_ip}"
        Rails.logger.info "The User Agent is: #{request.headers['User-Agent']}"

        "#{self.class}Audit".constantize.create(
            action: action,
            action_occured_at: Time.now,
            client_ip: request.remote_ip,
            user_agent: request.headers['User-Agent'],
            "#{self.class}".foreign_key.to_sym => self.id
          )
      end
    end
  end
end