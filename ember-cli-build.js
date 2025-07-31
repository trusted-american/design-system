'use strict';

const EmberAddon = require('ember-cli/lib/broccoli/ember-addon');
const tailwind = require('tailwindcss');
const autoprefixer = require('autoprefixer');

module.exports = function (defaults) {
  const app = new EmberAddon(defaults, {
    'ember-cli-babel': { enableTypeScriptTransform: true },

    // Add options here

    snippetSearchPaths: ['tests/dummy/app'],

    postcssOptions: {
      compile: {
        cacheInclude: [/.*\.(css|scss|hbs|gts)$/, /.tailwind\.config\.js$/],
        plugins: [tailwind, autoprefixer],
      },
    },
  });

  // app.import('node_modules/bootstrap/dist/css/bootstrap.css');

  /*
    This build file specifies the options for the dummy test app of this
    addon, located in `/tests/dummy`
    This build file does *not* influence how the addon or the app using it
    behave. You most likely want to be modifying `./index.js` or app's build file
  */

  const { maybeEmbroider } = require('@embroider/test-setup');
  return maybeEmbroider(app, {
    skipBabel: [
      {
        package: 'qunit',
      },
    ],
  });
};
