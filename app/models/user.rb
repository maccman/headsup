class User < ActiveRecord::Base
  attr_accessible :note
  
  class << self
    def authorize_google!(auth)
      return unless auth && auth.uid
      user = self.find_by_uid(auth.uid) || self.new
      user.uid           = auth.uid
      user.first_name    = auth.info.first_name
      user.last_name     = auth.info.last_name
      user.email         = auth.info.email
      user.avatar_url    = auth.info.image
      user.google_token  = auth.credentials.token
      user.save!
      user
    end
  end
  
  def google
    Google::Client.new(google_token)
  end
end
