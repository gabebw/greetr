$(function(){
  var pusher = new Pusher(window.PUSHER_KEY, { authEndpoint: '/pusher_authentication' });
  var channel = pusher.subscribe(window.CHANNEL);

  channel.bind('sent', function(data) {
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

  $("#new_greeting").submit(function(){
    var data = $(this).serialize();
    var $status = $("#status");

    var successfullySent = function(){
      $("#greeting_body").val("");
      $status.hide().text("Sent!").fadeIn();
    };

    var unsuccessfullySent = function(){
      $status.hide().text("Failed - did you type anything?").fadeIn();
    };

    $.post("/greetings", data).
      done(successfullySent).
      fail(unsuccessfullySent);
    return false;
  });
});
