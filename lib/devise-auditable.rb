require 'devise'
require 'devise_auditable/version'
require 'devise_auditable/engine'

Devise.add_module :auditable, :model => 'devise_auditable/model'
