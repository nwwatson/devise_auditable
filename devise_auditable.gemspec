$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise_auditable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_auditable"
  s.version     = DeviseAuditable::VERSION
  s.authors     = ["Nicholas W. Watson"]
  s.email       = ["nick@entropi.co"]
  s.homepage    = "http://github.com/entropillc/devise_auditable"
  s.summary     = "Auditing Plugin for Devise"
  s.description = "Auditing Plugin for Devise"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "README.md"]
  s.test_files = Dir["test/**/*"]
  
  s.add_dependency "devise"
  s.add_dependency "warden"
  s.add_dependency "rails"
  s.add_development_dependency "sqlite3"
end
