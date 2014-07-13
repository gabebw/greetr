$(function(){
  $("#new_greeting").submit(function(){
    var data = $(this).serialize();
    var $status = $("#status");

    var successfullySent = function(){
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
