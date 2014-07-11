$(function(){
  var pusher = new Pusher(window.PUSHER_KEY, { authEndpoint: '/pusher_authentication' });
  var channel = pusher.subscribe(window.CHANNEL);

  var highlight = function($element){
    var yellow = "#ffff99";
    var white = "#ffffff";

    $element.fadeIn().
      css({ backgroundColor: yellow }).
      animate({backgroundColor: white}, {
        complete: function() {
          $element.css({backgroundColor: white});
        }
      });
  };

  channel.bind('sent', function(data){
    var message = data.message;
    var newGreeting = $("<div>").css({class: "greeting"}).html(message).hide();

    newGreeting.find("abbr.timeago").timeago();
    $("#greetings").prepend(newGreeting);
    titleNotification.increaseNumberOfNotifications();
    highlight(newGreeting);
  });

  channel.bind('new_user', function(data){
    var user = data.message;
    var newOption = $("<option>").prop("value", user.id).text(user.username);
    $("#greeting_receiver_id").append(newOption);
  });
});
