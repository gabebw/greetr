class GreetingsController < ApplicationController
  def index
    @greeting = Greeting.new
    @greetings = Greeting.for_homepage_of(current_user)
  end

  def create
    greeting = current_user.greetings.new(greeting_params)

    if greeting.save
      push_to_receiver(greeting)

      render json: { status: "OK" }
    else
      render json: { status: "Failed" }, status: 422
    end
  end

  private

  def greeting_params
    params.require(:greeting).permit(:body, :receiver_id)
  end

  def push_to_receiver(greeting)
    html = render_to_string(greeting)
    data = { message: html }
    Pusher[greeting.receiver.pusher_channel_name].trigger('sent', data)
  end
end
