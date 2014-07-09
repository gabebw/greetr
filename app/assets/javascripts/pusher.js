$(function(){
  var pusher = new Pusher(window.PUSHER_KEY, { authEndpoint: '/pusher_authentication' });
  var channel = pusher.subscribe(window.CHANNEL);
  channel.bind('sent', function(data) {
    var message = data.message;
    var pTag = $("<p>").html(message);
    $("#yos").prepend(pTag);
  });

  $("#new_yo").submit(function(){
    var data = $(this).serialize();
    $.post("/yos", data);
    return false;
  });
});
