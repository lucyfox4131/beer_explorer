class UsersController < ApplicationController
  def show
    if current_user
      @user = current_user
      @beer = current_user.recommendation unless @user.rated_beers.empty?
    else
      flash[:notice] = "Please Sign In To See Your Dashbaord"
      redirect_to root_path
    end
  end
end
