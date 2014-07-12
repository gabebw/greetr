class PusherClient
  CHANNEL_PREFIX = "private-greetings-"

  def self.user_id_from_channel_name(full_channel_name)
    full_channel_name.sub(CHANNEL_PREFIX, "").to_i
  end

  def self.channel_name(user_id)
    "#{CHANNEL_PREFIX}#{user_id}"
  end

  def self.send_greeting_to(user_id, greeting_html)
    data = { message: greeting_html }
    Pusher[channel_name(user_id)].trigger('sent', data)
  end

  def self.tell_everyone_about_the_new_user(user)
    data = { message: { username: user.username, id: user.id } }

    User.except(user).find_each do |user|
      Pusher[channel_name(user.id)].trigger("new_user", data)
    end
  end
end
