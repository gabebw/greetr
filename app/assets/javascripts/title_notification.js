(function(){
  var TitleNotification = function(){
    this.defaultTitle = "Greetr";
    this.numberOfNotifications = 0;
    this.blurred = false;
  };

  TitleNotification.prototype.increaseNumberOfNotifications = function(){
    if( this.blurred ){
      this.numberOfNotifications += 1;
      document.title = "(" + this.numberOfNotifications + ") " + this.defaultTitle;
    }
  }

  TitleNotification.prototype.onFocus = function(){
    this.clear();
    this.blurred = false;
  }

  TitleNotification.prototype.clear = function(){
    this.numberOfNotifications = 0;
    document.title = this.defaultTitle;
  }

  TitleNotification.prototype.markAsBlurred = function(){
    this.blurred = true;
  }

  window.titleNotification = new TitleNotification();
})();

$(window).focus(function(){
  titleNotification.onFocus();
});

$(window).blur(function(){
  titleNotification.markAsBlurred();
});
