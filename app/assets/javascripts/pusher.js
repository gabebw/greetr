$(function(){
  // Enable pusher logging - don't include this in production
  Pusher.log = function(message) {
    if (window.console && window.console.log) {
      window.console.log(message);
    }
  };

  var pusher = new Pusher('880e597cf4a3b4d64c95');
  var channel = pusher.subscribe('yos');
  channel.bind('sent', function(data) {
    console.log(data);
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
