class AppController < ApplicationController
  before_filter :require_user

  def index
    @user = current_user
  end
  
  def calendar
    @events = current_user.google.calendar
    render :json => @events
  end
  
  def email
    @emails = current_user.google.email
    render :json => @emails
  end
end
