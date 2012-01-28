Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], scope: "userinfo.email,userinfo.profile,https://www.google.com/m8/feeds"
end