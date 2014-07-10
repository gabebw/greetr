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
    data = { message: { username: @user.username, id: @user.id } }
    User.except(@user).find_each do |user|
      Pusher[user.pusher_channel_name].trigger("new_user", data)
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
