$(function(){
  var pusher = new Pusher(window.PUSHER_KEY, { authEndpoint: '/pusher_authentication' });
  var channel = pusher.subscribe(window.PUSHER_CHANNEL_NAME);

  channel.bind('sent', PusherCallbacks.onSent);
  channel.bind('new_user', PusherCallbacks.onNewUser)
});
