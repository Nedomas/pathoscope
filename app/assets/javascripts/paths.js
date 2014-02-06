var Paths = (function() {
  var init = function() {
    // _.each($('.path'), function(box) {
    //   $(box).wrap("<div class='overlay'></div>");
    // });
  };

  return {
    init: init,
    _private: eval(private(arguments))
  }
})();

jQuery(function($) {
  Paths.init();
});
