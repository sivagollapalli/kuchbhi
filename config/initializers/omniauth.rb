# require 'openid/store/filesystem'

# if Rails.env.development? || Rails.env.test?
#   OmniAuth.config.full_host = "http://127.0.0.1:3000"
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']#, {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
# end
