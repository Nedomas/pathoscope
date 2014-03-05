//= require explore

var World = (function() {

  var init = function() {
    Explore.init('world');
  };

  return {
    init: init,
    _private: eval(private(arguments))
  };
})();

jQuery(function($) {
  World.init();
});
