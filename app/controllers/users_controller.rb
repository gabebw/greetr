class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      tell_everyone_about_the_new_user
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tell_everyone_about_the_new_user
    PusherClient.tell_everyone_about_the_new_user(@user)
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
