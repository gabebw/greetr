Monban.configure do |config|
  config.user_lookup_field = :username
  config.no_login_redirect = { controller: '/homes', action: 'show' }
end
