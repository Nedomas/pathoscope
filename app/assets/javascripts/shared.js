_.templateSettings = {
  evaluate:    /\{\{#([\s\S]+?)\}\}/g,            // {{# console.log("stuff") }}
  interpolate: /\{\{[^#\{]([\s\S]+?)[^\}]\}\}/g,  // {{ title }}
  escape:      /\{\{\{([\s\S]+?)\}\}\}/g,         // {{{ title }}}
};

// Automaticly return all functions on a module via 'eval(private(arguments))'
// Refs Remi
var private = function(funs) {
  var regex = /(?:^|\n) {2}\bvar\b\s+(\w+)\s*=\s*function/g;
  var m, list = [];
  var code = funs.callee.toString();

  while (m = regex.exec(code)) {
    for (var i=1; i < m.length; i++) {
      if (m[i] != undefined) {
        list.push(m[i]+':'+m[i]);
      }
    }
  }
  return '({'+list.join(',')+'})';
};

var App = (function() {
  var init = function() {
    $('nav li.nodes').powerTip({
      placement: 's',
      smartPlacement: true
    });

    $('nav li.paths').powerTip({
      placement: 's',
      smartPlacement: true
    });

    $('article .nodes').powerTip({
      placement: 's',
      smartPlacement: true
    });
  };

  return {
    init: init,
    _private: eval(private(arguments))
  }
})();

jQuery(function($) {
  App.init();
});
