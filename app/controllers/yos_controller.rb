class YosController < ApplicationController
  def index
    @yo = Yo.new
    @yos = Yo.addressed_to(current_user).newest_first
  end

  def create
    yo = current_user.yos.create(yo_params)

    text = render_to_string(yo)
    data = { message: text }

    Pusher["yos-#{yo.receiver.id}"].trigger('sent', data)

    render json: { status: "OK" }
  end

  private

  def yo_params
    params.require(:yo).permit(:receiver_id)
  end
end
