APP_VERSION = Time.now.utc.to_i;

User.find_each do |user|
  data = { new_version: APP_VERSION }
  Pusher[user.pusher_channel_name].trigger("new_app_version", data)
end
