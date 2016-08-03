class UsersController < ApplicationController
  def show
    if current_user
      @user = current_user
    else
      flash[:notice] = "Please Sign In To See Your Dashbaord"
      redirect_to root_path
    end
  end
end
