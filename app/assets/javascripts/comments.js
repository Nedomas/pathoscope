var Comments = (function() {
  var showing, list, location, comments_button, post_open_button, count, post_open;

  var init = function() {
    comments_button = $('.comments-button');
    post_open_button = $('.post-open-button');
    list = $('.comments ul');
    location = window.location.pathname;

    $(document).on('click', 'button#post', post);
    comments_button.click(toggle);
    post_open_button.click(toggleOpen);
    repaint();
  };

  var toggleOpen = function() {
    if (post_open) {
      post_open = false;
    } else {
      repaint();
      post_open = true;
      post_open_button.hide();
    }
  };

  var toggle = function() {
    if (showing) {
      list.hide();
      showing = false;
      comments_button.text('Notes (' + count + ')');
    } else {
      list.show();
      repaint();
      showing = true;
      comments_button.text('Hide notes');
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
        if (post_open) {
          var new_comment_template = $('#new-comment-template').html();
          list.app***REMOVED***(_.template(new_comment_template));
        }
      } else {
        var login_to_comment_template = $('#login-to-comment-template').html();
        list.app***REMOVED***(_.template(login_to_comment_template));
        post_open_button.hide();
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
      $.getJSON('/comments/create', data, function() {
        repaint();
      });
    }
  };

  return {
    init: init,
    _private: eval(private(arguments))
  };
})();

jQuery(function() {
  var location = window.location.pathname;

  if (location.match(/\/paths\/\d/) || location.match('/explore')) {
    Comments.init();
  }
});
