//= require explore

var Map = (function() {

  var init = function() {
    Explore.init('map');
  };

  return {
    init: init,
    _private: eval(private(arguments))
  };
})();

jQuery(function($) {
  Map.init();
});
