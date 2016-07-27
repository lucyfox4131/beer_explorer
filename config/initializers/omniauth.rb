Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLECLIENTID"], ENV["GOOGLECLIENTSECRET"]
end
