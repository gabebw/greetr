window.PusherCallbacks = {
  onSent: function(data){
    var message = data.message;
    var newGreeting = $("<div>").css({class: "greeting"}).html(message).hide();

    newGreeting.find("abbr.timeago").timeago();
    $("#greetings").prepend(newGreeting);
    titleNotification.increaseNumberOfNotifications();
    highlight(newGreeting);
  },

  onNewUser: function(data){
    var user = data.message;
    var newOption = $("<option>").prop("value", user.id).text(user.username);
    $("#greeting_receiver_id").append(newOption);
  }
}
