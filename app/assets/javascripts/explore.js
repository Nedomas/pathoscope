var Explore = (function() {
  var server, type, data;
  var place, map_place, world_place;
  var path_template, link_template, dead_***REMOVED***_link_template, path_tag_template,
    notes_box_template;

  var debug = function() {
    debugger;
  };

  var init = function(_type) {
    server = gon.global.server;
    type = _type;
    map_place = $('.map');
    world_place = $('.world');
    path_template = $('#path-template').html();
    link_template = $('#link-template').html();
    dead_***REMOVED***_link_template = $('#dead-***REMOVED***-link-template').html();
    path_tag_template = $('#path-tag-template').html();
    notes_box_template = $('#notes-box-template').html();

    bindButtons();
    redraw(gon.item_id);
  };

  var bindButtons = function() {
    $(document).on('click', '.notes-indicator a', toggleNotes);
    $(document).on('click', '.arrow a', toggleList);
  };

  var toggleNotes = function() {
    event.preventDefault()

    var li = $(this).closest('li');
    var next_li = li.next();

    if (next_li.hasClass('notes')) {
      next_li.remove();
    } else {
      li.after(_.template(notes_box_template, { klass: 'level-' + Helper.getLevel(li) } ));
    }
  };

  var toggleList = function(event) {
    event.preventDefault()

    var li = $(this).closest('li');
    var level = Helper.getLevel(li);

    if (level != 1) {
      redraw(li.data('item_id'));
    }

    var next_all = li.nextAll();

    _.each(next_all, function(next_li) {
      var next_level = Helper.getLevel(next_li);
      if (next_level > level) {
        $(next_li).toggle();
      } else {
        return false;
      }
    });
  };


  var redraw = function(item_id) {
    if (type == 'world') {
      history.pushState('pathoscope', 'Pathoscope', '/world/' + item_id);
    }

    place = eval(type + '_place');
    place.html('Loading...');

    getData(type, item_id).then(function(_data) {
      data = _data;
      place.html('');
      recursivePopulate(data.structure);
    });
  };

  var getData = function(type, item_id) {
    var urls = {
      map: '/map/data',
      world: '/world'
    };

    return $.ajax({
      type: 'GET',
      url: server + urls[type],
      data: {
        item_id: item_id
      },
      xhrFields: {
        withCredentials: true
      }
    });
  };

  var recursivePopulate = function(structure, level) {
    level = level || 0;

    _.each(structure, function(branch) {
      _.each(branch, function(children, item_id) {
        paintItem(item_id, level, _.isEmpty(children));

        // continue only for 2 levels
        if (level < 2) recursivePopulate(children, level+1);
      });

    });
  };

  var paintItem = function(item_id, level, dead_***REMOVED***) {
    var item = getItem(item_id);
    var klass = 'level-' + level;
    if (parseInt(item_id) == data.center) klass += ' center';

    var item_data = _.defaults(getContext(item), { klass: klass, color: '' });
    var template;

    if (isPath(item)) {
      template = path_template;
    } else if (dead_***REMOVED***) {
      template = dead_***REMOVED***_link_template;
    } else {
      template = link_template;
    }

    place.app***REMOVED***(_.template(template, item_data));
  };

  var isPath = function(item) {
    return item.context_type == 'Path';
  };

  var getContext = function(item) {
    return isPath(item) ? getPath(item.context_id) : getLink(item.context_id);
  };

  var getItem = function(id) {
    return data.items[id];
  };

  var getPath = function(id) {
    return data.paths[id];
  };

  var getLink = function(id) {
    return data.links[id];
  };

  return {
    init: init,
    _private: eval(private(arguments))
  };
})();
