class PusherAuthenticationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    if can_subscribe_to_channel?
      render json: authenticated_response
    else
      render text: "Unauthorized", status: "401"
    end
  end

  private

  def can_subscribe_to_channel?
    current_user.id == user_id_associated_with_channel
  end

  def authenticated_response
    Pusher[params[:channel_name]].authenticate(params[:socket_id])
  end

  def user_id_associated_with_channel
    PusherClient.user_id_from_channel_name(params[:channel_name])
  end
end
