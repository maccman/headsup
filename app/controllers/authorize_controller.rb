class AuthorizeController < ApplicationController  
  def create
    self.current_user = User.authorize_google!(
      request.env["omniauth.auth"]
    )
    redirect_to "/"
  end
  
  def failure
    raise "OAuth failure - #{params[:message]}"
  end
  
  def destroy
    reset_session
    cookies.delete(:user_id)
    render :text => "Logged out"
  end
end