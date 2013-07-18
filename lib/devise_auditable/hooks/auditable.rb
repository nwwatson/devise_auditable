Warden::Manager.after_authentication do |record, warden, opts|
  if record.respond_to?(:audit_login!)
    record.audit_login!(warden.request)
  end
end

Warden::Manager.before_logout do |record, warden, opts|
  if record.respond_to?(:audit_logout!)
    record.audit_logout!(warden.request)
  end
end