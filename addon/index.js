'use strict';

module.exports = {
  name: require('./package').name,

  options: {
    'ember-cli-babel': { enableTypeScriptTransform: true },
  },

  included(app) {
    this._super.included.apply(this, arguments);

    app.import('node_modules/ember-power-select/vendor/ember-power-select.css');
  },
};
