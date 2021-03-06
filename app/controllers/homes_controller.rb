class HomesController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def show
    if signed_in?
      redirect_to :greetings
    else
      render :show
    end
  end
end
