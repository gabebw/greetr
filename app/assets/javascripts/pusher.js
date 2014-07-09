$(function(){
  var pusher = new Pusher(window.PUSHER_KEY, { authEndpoint: '/pusher_authentication' });
  var channel = pusher.subscribe(window.CHANNEL);
  channel.bind('sent', function(data) {
    var message = data.message;
    var pTag = $("<p>").html(message).hide();
    var yellow = "#ffff99";
    var white = "#ffffff";

    $("#yos").prepend(pTag);
    pTag.fadeIn().
      css({ backgroundColor: yellow }).
      animate({backgroundColor: white}, {
        complete: function() {
          pTag.css({backgroundColor: white});
        }
      });
  });

  $("#new_yo").submit(function(){
    var data = $(this).serialize();
    $.post("/yos", data);
    return false;
  });
});
