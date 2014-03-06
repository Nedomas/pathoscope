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
    $(document).on('click', '.arrow a', toggleTree);
  };

  var toggleNotes = function() {
    event.preventDefault();

    var li = $(this).closest('li');
    var next_li = li.next();

    if (next_li.hasClass('notes')) {
      next_li.remove();
    } else {
      li.after(_.template(notes_box_template, { klass: 'level-' + Helper.getLevel(li) } ));
    }
  };

  var toggleTree = function(event) {
    event.preventDefault();

    var li = $(this).closest('li');
    treeOpen(li) ? closeTree(li) : openLeaf(li);
  };

  var treeOpen = function(element) {
    return !$(element).hasClass('closed');
  };

  var closeTree = function(element, recursive_started) {
    var root_leaf;
    if (!recursive_started) root_leaf = element;

    var jelement = $(element);
    var element_level = Helper.getLevel(jelement);

    jelement.addClass('closed');
    if (element != root_leaf) jelement.addClass('hidden');

    var branches = jelement.nextAll();
    _.each(branches, function(branch) {
      var level = Helper.getLevel(branch);

      if (level > element_level) {
        closeTree(branch, true);
      } else {
        return false;
      }
    });
  };

  var openLeaf = function(element, root) {
    var jelement = $(element);
    var level = Helper.getLevel(jelement);
    root = root || { element: element, level: level };

    if (element == root.element) {
      jelement.removeClass('closed');
    }

    if (+level == root.level+1) {
      jelement.removeClass('hidden');
    } else {
      // debugger;
    }
    console.log(root);
    console.log('element', element, 'level', level);
    if (level > root+2) return true;

    var branches = jelement.nextAll();
    _.each(branches, function(branch) {
      // var level = Helper.getLevel(branch);

      openLeaf(branch, root);
      // if (level > +1) {
      //   openLeaf(branch, true);
      // } else {
      //   return false;
      // }
    });
  };


  var showHide = function(element) {
    var jelement = $(element);
    var visible = jelement.is(':visible');
    var fun = visible ? 'addClass' : 'removeClass';
    jelement[fun]('hidden');
  };

  var openClose = function(element, init) {
    var jelement = $(element);
    var item = itemFromLi(jelement);
    var element_level = Helper.getLevel(jelement);

    // early reload when moving over collection boundary
    if (!init && element_level != 1 && !isPath(item)) return redraw(item.id);

    // if (item.id == 2) debugger;
    toggleClosed(jelement);
    var children = jelement.nextAll();

    _.each(children, function(child) {
      var level = Helper.getLevel(child);

      if (level > element_level) {
        if (level >= 2) closeKlass($(child));
        showHide(child);
      } else {
        return false;
      }
    });
  };

  var toggleClosed = function(element) {
    var jelement = $(element);
    var closed = jelement.hasClass('closed');
    var fun = closed ? openKlass : closeKlass;
    fun(jelement);
  };

  var closeKlass = function(jelement) {
    jelement.addClass('closed');
  };

  var openKlass = function(jelement) {
    jelement.removeClass('closed');
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
      // data.structure = JSON.parse('[{"5":[{"6":[]}]}]');
      recursivePopulate(data.structure);
      initToggles(data.open_roots);
    });
  };

  var initToggles = function(open_roots) {
    var root_lis = $('li.level-0');
    // hide all roots
    _.each(root_lis, function(root) {
      closeTree(root);
    });
    // _.each(root_lis, function(li) { openClose($(li), 'init') });

  //   _.each(open_roots, function(item_id) {
  //     var open_li = _.select(root_lis, function(li) {
  //       return $(li).data('item_id') == item_id;
  //     });

  //     if (!_.isEmpty(open_li)) openClose($(open_li), 'init');
  //   });
//
//     // early reload when moving over collection boundary
//     // if (!init && element_level != 1 && !isPath(item)) return redraw(item.id);
//
//     // if (item.id == 2) debugger;
//     toggleClosed(jelement);
//     var children = jelement.nextAll();
//
//     _.each(children, function(child) {
//       var level = Helper.getLevel(child);
//
//       if (level > element_level) {
//         if (level >= 2) closeKlass($(child));
//         showHide(child);
//       } else {
//         return false;
//       }
//     });
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
        drawItem(item_id, level, _.isEmpty(children));

        // if (item_id == 4) debugger;
        // continue only for 2 levels
        if (level < 2) recursivePopulate(children, level+1);
      });

    });
  };

  var drawItem = function(item_id, level, dead_***REMOVED***) {
    var item = getItem(item_id);
    var klass = 'level-' + level;
    if (parseInt(item_id) == data.center) klass += ' center';

    var item_data = _.defaults(getContext(item), { klass: klass, color: '' });
    isPath(item) ? drawPath(item_data) : drawLink(item_data, dead_***REMOVED***);
  };

  var drawPath = function(item_data) {
    place.app***REMOVED***(_.template(path_template, item_data));
  };

  var drawLink = function(item_data, dead_***REMOVED***) {
    var template;

    if (dead_***REMOVED***) {
      template = dead_***REMOVED***_link_template;
    } else {
      template = link_template;
    }

    place.app***REMOVED***(_.template(template, item_data));
    drawPathTags(item_data.path_ids);
  };

  var drawPathTags = function(path_ids) {
    var paths_place = place.find('li:last-child .paths');

    _.each(path_ids, function(path_id) {
      var path = getPath(path_id);

      paths_place.app***REMOVED***(_.template(path_tag_template, path));
    });
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

  var itemFromLi = function(li) {
    return getItem($(li).data('item_id'));
  };

  return {
    init: init,
    _private: eval(private(arguments))
  };
})();
