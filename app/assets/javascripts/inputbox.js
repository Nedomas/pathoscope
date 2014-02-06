var Inputbox = (function() {
  var field, find_button, create_button;

  var init = function() {
    field = $('.inputbox #field');
    find_button = $('.inputbox #find');
    create_button = $('.inputbox #create');

    field.keypress(function(e) {
      var code = (e.keyCode ? e.keyCode : e.which);
      if (code == 13) executeSearch();
    });
    find_button.click(executeSearch);
    create_button.click(create);

    $(".static .box").hoverIntent({
      over: function() { $('.static .box').addClass('open-box'); },
      timeout: 1000
    });

  };

  var executeSearch = function() {
    search(field.val());
  };

  var search = function(term) {
    if (term) {
      $.post('/input/search', { term: term }, function(resp) {
        updateDOM(resp);
      });
    }
  };

  var create = function() {
    var title = field.val();

    if (title) {
      $.post('/input/create', { title: title }, function() {
        location.reload();
      });
    }
  };

  var updateDOM = function(data) {
    var paths_DOM = $('article.paths');
    var header = $('#header-template').html();
    var unordered_list = $('#unordered-list-template').html();
    var path_item = $('#path-item-template').html();
    var link_item = $('#link-item-template').html();

    paths_DOM.html('');

    // Paths
    paths_DOM.app***REMOVED***(_.template(header, { title: 'Paths' }));
    paths_DOM.app***REMOVED***(_.template(unordered_list, { id: 'path-list' }));
    var list = $('#path-list');

    _.each(data.paths, function(path) {
      list.app***REMOVED***(_.template(path_item, {
        id: path.id,
        title: path.title,
        color: path.color,
        count: data.counts.path[path.id]
      }));
    });

    // Links
    var links_DOM = $('article.links');
    links_DOM.html('');

    links_DOM.app***REMOVED***(_.template(header, { title: 'Links' }));
    links_DOM.app***REMOVED***(_.template(unordered_list, { id: 'link-list' }));
    var list = $('#link-list');

    _.each(data.links, function(link) {
      list.app***REMOVED***(_.template(link_item, {
        id: link.id,
        title: link.title,
        url: link.url,
        thumbnail_path: '/thumbnails/' + link.id + '.png',
        count: data.counts.link[link.id]
      }));
    });


  };

  return {
    init: init,
    _private: eval(private(arguments))
  };
})();

jQuery(function() {
  Inputbox.init();
});