window._ps = _.noConflict();
window.$ps = jQuery.noConflict();

/**
 * Super namespace that all our libs and apps will live on. We also extend all
 * of the native Ember classes as well and exclusely use them that way so we can
 * alter the behavior in one place without needing to reopen the original class.
 *
 * We call the super namespace PS for Pivotshare, call it what you'd like.
 */
window.PS = Ember.Namespace.create();

// Create our custom resolver so we can have Ember look up classes on multiple
// namespaces
PS.Resolver = Ember.DefaultResolver.extend({
  resolveOther: function (parsedName) {
    var value = this._super(parsedName);
    var childNamespaces = Ember.get(parsedName, 'root.childNamespaces');

    // If it didn't resolve to anything, let's see if it's on one of
    // the child namespaces
    if (!value && childNamespaces) {
      for (var i = 0, l = childNamespaces.get('length'); i < l; i++) {
        // Change the namespace (root) that Ember will
        // use to look it up on
        parsedName.root = childNamespaces.objectAt(i);

        // Call original method again, with this different namespace
        value = this._super(parsedName);

        // First match found, wins.
        if (value) return value;
      }
    }

    // If reached, no match was found.
    // Ember will take it from here
  }
});

// Extending the default Ember.Application behavior
PS.Application = Ember.Application.extend({
  // Here is where we tell Ember to use our custom Resolver, defined above
  Resolver: PS.Resolver,
  childNamespaces: null,

  init: function () {
    this._super();

    // Needs to be an array if one wasn't provided
    if (!this.get('childNamespaces')) {
      this.set('childNamespaces', []);
    }
  }
});

// Extending the default ObjectController behavior
PS.ObjectController = Ember.ObjectController.extend({
  // Add common helpers/properties/features you always use
});
PS.ArrayController = Ember.ArrayController.extend({
  // Add common helpers/properties/features you always use
});
PS.Route = Ember.Route.extend({
  // Add common helpers/properties/features you always use
});

/**
 * PS.Core lives common components, views, models, etc
 */
PS.Core = Ember.Namespace.create();
PS.Web = Ember.Namespace.create();
PS.Standalone = Ember.Namespace.create();

// Just an example from today, put on PS.Core
PS.Core.IndexController = PS.ObjectController.extend({
  firstName: null,
  lastName: null
});

// Notice we're creating an instance of our PS.Application and providing PS.Core
// as a child namespace so that IndexController will resolve.
// window.PS.App = PS.Application.create({
//   childNamespaces: [PS.Core]
// });

// If we don't provide a PS.SomeApp.IndexController, PS.Core.IndexController will be
// used instead! wooohoo
