APP_VERSION = Time.now.utc.to_i;

PusherClient.tell_everyone_about_new_app_version(APP_VERSION)
