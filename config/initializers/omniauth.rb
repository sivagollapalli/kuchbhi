ENV['TWITTER_KEY'] = "N8Z9w84TXg1o65YLQKcnA"
ENV['TWITTER_SECRET'] = "j811pXOnvWPWDl5kKrlRQgbDKZemFMDQPGahsOnTvU"

if Rails.env.production?
  ENV['FACEBOOK_KEY'] = '114907765330779'
  ENV['FACEBOOK_SECRET'] = '8e777fe4731d16a1a16c50bd371b2674'
else
  ENV['FACEBOOK_KEY'] = '286456701455015'
  ENV['FACEBOOK_SECRET'] = '04da1b8e9e25fa1b04ec9f482b878829'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,  ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
