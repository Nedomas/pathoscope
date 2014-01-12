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
      $.post('/input/create', { title: title }, function(resp) {
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
      list.app***REMOVED***(_.template(path_item, { id: path.id, title: path.title, color: path.color }));
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
        image_path: '/thumbnails/' + link.id + '.png'
      }));
    });


  };

  return {
    init: init,
    _private: eval(private(arguments))
  };
})();

var Comments = (function() {
  var DOM, showing, list, location, comments_button, count;

  var init = function() {
    comments_button = $('.comments-button');
    list = $('.comments ul');
    location = window.location.pathname;

    $(document).on('click', 'button#post', post);
    comments_button.click(toggle);
  };

  var toggle = function() {
    if (showing) {
      list.hide();
      showing = false;
      comments_button.text('Comments (' + count + ')');
    } else {
      list.show();
      repaint();
      showing = true;
      comments_button.text('Hide comments');
    }
  };

  var repaint = function() {
    $.getJSON('/comments/index', { location: location }, function(resp) {
      count = resp.comments.length;

      var comment_item = $('#comment-template').html();

      list.html('');

      _.each(resp.comments, function(comment) {
        var vars = {
          name: comment.name,
          time: $.timeago(comment.time),
          content: comment.content
        };

        list.app***REMOVED***(_.template(comment_item, vars));
      });

      if (resp.logged_in) {
        var new_comment_template = $('#new-comment-template').html();
        list.app***REMOVED***(_.template(new_comment_template));
      }
    });
  };

  var post = function() {
    var content_field = $('textarea#content');
    create(content_field.val());
  };

  var create = function(content) {
    if (content) {
      var data = { content: content, location: location };
      $.getJSON('/comments/create', data, function(resp) {
        repaint();
      });
    }
  };

  return {
    init: init,
    _private: eval(private(arguments))
  }
})();

jQuery(function($) {
  Inputbox.init();
  Comments.init();
});
