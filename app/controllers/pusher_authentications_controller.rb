class PusherAuthenticationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    if can_subscribe_to_channel?
      result = Pusher[params[:channel_name]].authenticate(params[:socket_id])
      render json: result
    else
      render text: "Forbidden", status: '403'
    end
  end

  private

  def can_subscribe_to_channel?
    current_user.id == user_id_associated_with_channel
  end

  def user_id_associated_with_channel
    params[:channel_name].sub("private-yos-", "").to_i
  end
end
