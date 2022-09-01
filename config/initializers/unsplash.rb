Unsplash.configure do |config|
  config.application_access_key = Rails.application.credentials.unsplash[:access]
  config.application_secret = Rails.application.credentials.unsplash[:secret]
  config.application_redirect_uri = 'urn:ietf:wg:oauth:2.0:oob'
  config.utm_source = 'kittenfest'
end
