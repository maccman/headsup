class User < ActiveRecord::Base
  class << self
    def authorize_google!(auth)
      return unless auth && auth.uid
      user = self.find_by_uid(auth.uid) || self.new
      user.email         = auth.info.email
      user.google_token  = auth.credentials.token
      user.save!
      user
    end
  end
end
