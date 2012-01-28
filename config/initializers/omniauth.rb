Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], approval_prompt: '', scope: "userinfo.email,userinfo.profile,https://www.googleapis.com/auth/calendar.readonly,https://mail.google.com/mail/feed/atom/"
  on_failure do |env, msg|
    [200, {}, [env["omniauth.error"].inspect + ' ' + msg.to_s]] 
  end
end