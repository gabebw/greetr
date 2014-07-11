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

