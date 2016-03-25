OmniAuth.config.full_host = Rails.env.production? ? 'http://treview.com' : 'http://localhost:3000'

Rails.application.middleware.use OmniAuth::Builder do
  provider( :facebook, Figaro.env.facebook_app_id, Figaro.env.facebook_app_secret )
end