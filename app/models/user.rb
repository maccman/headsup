class User < ActiveRecord::Base
  has_one :note
  
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
  
  def calendar
    google.calendar
  end
  
  def email
    
  end
  
  def serializable_hash(options = {})
    super(options.merge(
      :methods => [
        :calendar, :email
      ],
      :include => :note
    ))
  end
  
  protected
    def google
      Google::Client.new(google_token)
    end
end
