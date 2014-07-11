var TitleNotification = function(){
  this.defaultTitle = "Greetr";
  this.numberOfNotifications = 0;
  this.blurred = false;
};

TitleNotification.prototype.increaseNumberOfNotifications = function(){
  if( this.blurred ){
    this.numberOfNotifications += 1;
    console.log("BLURRED!");
    document.title = "(" + this.numberOfNotifications + ") " + this.defaultTitle;
  } else {
    console.log("not blurred!");
  }
}

TitleNotification.prototype.clear = function(){
  this.numberOfNotifications = 0;
  document.title = this.defaultTitle;
}

TitleNotification.prototype.markAsBlurred = function(){
  this.blurred = true;
}

var titleNotification = new TitleNotification();

$(window).focus(function(){
  titleNotification.clear();
});

$(window).blur(function(){
  titleNotification.markAsBlurred();
});
