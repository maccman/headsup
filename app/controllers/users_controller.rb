class UsersController < ApplicationController
  before_filter :find_user
  
  def update
    @user.update_attributes!(params[:user])
    head :ok
  end
  
  protected
    def find_user
      @user = current_user
    end
end