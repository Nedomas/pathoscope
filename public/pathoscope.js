var Pathoscope = (function(){

  var server = 'http://localhost:3000';

  var loadjQuery = function() {
    load('head', 'script', "//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js", loadjQueryUI);
  };

  var loadjQueryUI = function() {
    load('head', 'script', "//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js", loadjQueryCSS);
  };

  var loadjQueryCSS = function() {
    load('head', 'link', "//code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css", loadCSS);
  };

  var loadCSS = function() {
    load('head', 'link', server + '/popup.css', loadTemplates);
  };

  var loadTemplates = function() {
    $.get(server + '/bookmarks/templates').then(function(templates) {
      var html = $(templates).find('.content.cf');
      $('body').app***REMOVED***(html);
      init();
    });
  };

  var load = function(place, tag, url, callback) {
    var done = false;
    var element = document.createElement(tag);

    if (tag == 'link') {
      element.href = url;
      element.rel = "stylesheet";
      element.type = "text/css";
    } else {
      element.src = url;
    }

    element.onload = element.onreadystatechange = function(){
      if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
        if (tag == 'div') debugger;
        done = true;
        callback();
      }
    };

    document.getElementsByTagName(place)[0].app***REMOVED***Child(element);
  };

  var init = function() {
    var bookmarklet_url = $('script').last().attr('src');
    var current_url = window.location.href;

    console.log('initing');
    create(bookmarklet_url, current_url).then(function(resp) {
      show(resp);
    }).fail(function(err) {
      error(err);
    });
  };

  var create = function(bookmarklet_url, current_url) {
    return $.ajax({
      type: 'GET',
      url: server + '/bookmarks/create',
      xhrFields: { withCredentials: true },
      data: {
        href: current_url,
        bookmarklet: bookmarklet_url
      }
    });
  };

  var show = function(resp) {
    $('#pathoscope-dialog').dialog({
      height: 500,
      width: 500,
      modal: true
    });

    if (resp.logged_in) {
      successForm(resp);
    } else {
      loginForm();
    }
  };

  var successForm = function(data) {
    var html = $('div#pathoscope-success').last().clone();
    app***REMOVED***Paths(html, data.paths);
    html.show();
    $('#pathoscope-dialog').html(html);
  };

  var app***REMOVED***Paths = function(html, paths_json) {
    var paths = JSON.parse(paths_json);
    var list = $('<ul></ul>')

    $.each(paths, function(index, path) {
      list.app***REMOVED***("<li>" +
        "<div class='score circle'>" +
          path.count +
        "</div>" +
        "<div class='meta'>" +
          "<section class='title'>" +
            path.title +
          "</section>" +
          "<section class='url'>" +
            "<a href='" + path.url + "'>" +
              path.url +
            "</a>" +
          "</section>" +
        "</div>" +
      "</li>");
    });

    html.find('.paths').html(list)
  };

  var loginForm = function() {
    var html = $('div#pathoscope-login').last().clone();
    html.show();
    $('#pathoscope-dialog').html(html);
    html.find('.login-button').click(login);
  };

  var login = function() {
    var email = $('#pathoscope-login .email').last().val();
    var password = $('#pathoscope-login .password').last().val();

    var data = {
      remote: true,
      commit: "Sign in",
      utf8: "✓",
      user: {
        remember_me: 1,
        password: password,
        email: email
      }
    };

    return $.ajax({
      type: 'POST',
      url: server + '/users/sign_in.json',
      xhrFields: { withCredentials: true },
      data: data,
      success: function(resp) {
        init();
      },
      error: function(e) {
        alert('Auth failed');
      }
    });
  };

  var error = function(err) {
    console.log('Error', err);
  };

  return {
    loadjQuery: loadjQuery
  };
})();

Pathoscope.loadjQuery();
