$(function(){
  var onSubmit = function(){
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
  };

  var oneSecond = 1000;
  var waitTime = 5 * oneSecond;
  var throttledOnSubmit = _.throttle(onSubmit, waitTime)

  $("#new_greeting").submit(throttledOnSubmit);
});
