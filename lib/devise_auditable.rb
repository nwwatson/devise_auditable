unless defined?(Devise)
  require 'devise'
end
require 'devise_auditable'

Devise.add_module :auditable, :model => 'devise_auditable/model'

module DeviseAuditable
end

require 'devise_auditable/engine'