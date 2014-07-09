class YosController < ApplicationController
  def index
    @yo = Yo.new
    @yos = Yo.addressed_to(current_user).newest_first
  end

  def create
    yo = current_user.yos.create(yo_params)

    push_to_receiver(yo)

    render json: { status: "OK" }
  end

  private

  def yo_params
    params.require(:yo).permit(:receiver_id)
  end

  def push_to_receiver(yo)
    text = render_to_string(yo)
    data = { message: text }
    Pusher[yo.receiver.pusher_channel_name].trigger('sent', data)
  end
end
