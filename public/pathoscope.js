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
      height: 300,
      width: 300,
      modal: true
    });

    if (resp.logged_in) {
      successForm(resp);
    } else {
      loginForm();
    }
  };

  var successForm = function(data) {
    alert('logged');
  };

  var loginForm = function() {
    var html = $('#pathoscope-login').clone();
    html.show();
    $('#pathoscope-dialog').html(html);
  };

  var error = function(err) {
    console.log('Error', err);
  };

  return {
    loadjQuery: loadjQuery
  };
})();

Pathoscope.loadjQuery();
