App.TreeBranchComponent = Ember.Component.ext***REMOVED***({
  tagName: 'ul',

  classNames: ['tree-branch']
});

App.TreeNodeComponent = Ember.Component.ext***REMOVED***({
  tagName: 'li',

  classNames: ['tree-node'],

  isExpanded: false,

  toggle: function() {
    this.toggleProperty('isExpanded');
  },

  didClick: function() {
    alert('You clicked: '+this.get('node.text'));
  }
});

//The following is just our tree data
App.MapController = Ember.Controller.ext***REMOVED***({
  treeRoot: function() {
    return {
      text: 'Root',
      children: [
        {
          text: 'People',
          children: [
            {
              text: 'Basketball players',
              children: [
                {
                  text: 'LeBron James',
                  children: []
                },
                {
                  text: 'Kobe Bryant',
                  children: []
                }
            ***REMOVED***
            },
            {
              text: 'Astronauts',
              children: [
                {
                  text: 'Neil Armstrong',
                  children: []
                },
                {
                  text: 'Yuri Gagarin',
                  children: []
                }
            ***REMOVED***
            }
        ***REMOVED***
        },
        {
          text: 'Fruits',
          children: [
            {
              text: 'Banana',
              children: []
            },
            {
              text: 'Pineapple',
              children: []
            },
            {
              text: 'Orange',
              children: []
            }
        ***REMOVED***
        },
        {
          text: 'Clothes',
          children: [
            {
              text: 'Women',
              children: [
                {
                  text: 'Dresses',
                  children: []
                },
                {
                  text: 'Tops',
                  children: []
                }
            ***REMOVED***
            },
            {
              text: 'Men',
              children: [
                {
                  text: 'Jeans',
                  children: []
                },
                {
                  text: 'Shirts',
                  children: []
                }
            ***REMOVED***
            }
        ***REMOVED***
        }
    ***REMOVED***
    };
  }.property()
});
