class GreetingsController < ApplicationController
  def index
    @greeting = Greeting.new
    @greetings = Greeting.addressed_to(current_user).newest_first
  end

  def create
    greeting = current_user.greetings.create(greeting_params)

    push_to_receiver(greeting)

    render json: { status: "OK" }
  end

  private

  def greeting_params
    params.require(:greeting).permit(:receiver_id)
  end

  def push_to_receiver(greeting)
    html = render_to_string(greeting)
    data = { message: html }
    Pusher[greeting.receiver.pusher_channel_name].trigger('sent', data)
  end
end
