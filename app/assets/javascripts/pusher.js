$(function(){
  var pusher = new Pusher(window.PUSHER_KEY, { authEndpoint: '/pusher_authentication' });
  var channel = pusher.subscribe(window.CHANNEL);

  channel.bind('sent', function(data){
    var message = data.message;
    var pTag = $("<p>").html(message).hide();
    var yellow = "#ffff99";
    var white = "#ffffff";

    $("#greetings").prepend(pTag);
    pTag.fadeIn().
      css({ backgroundColor: yellow }).
      animate({backgroundColor: white}, {
        complete: function() {
          pTag.css({backgroundColor: white});
        }
      });
  });

  channel.bind('new_user', function(data){
    var user = data.message;
    var newOption = $("<option>").prop("value", user.id).text(user.username);
    $("#greeting_receiver_id").append(newOption);
  });
});
