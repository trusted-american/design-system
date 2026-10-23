'use strict';

const { embroiderSafe, embroiderOptimized } = require('@embroider/test-setup');

module.exports = function () {
  return {
    packageManager: 'pnpm',
    scenarios: [
      {
        name: 'ember-lts-5.8',
        npm: {
          devDependencies: {
            'ember-source': '~5.8.0',
          },
        },
      },
      {
        name: 'ember-lts-5.12',
        npm: {
          devDependencies: {
            'ember-source': '~5.12.0',
          },
        },
      },
      {
        name: 'ember-lts-6.4',
        npm: {
          devDependencies: {
            'ember-source': '~6.4.0',
          },
        },
      },
      {
        name: 'ember-lts-6.8',
        npm: {
          devDependencies: {
            'ember-source': '~6.8.0',
          },
        },
      },
      {
        name: 'ember-lts-6.12',
        npm: {
          devDependencies: {
            'ember-source': '~6.12.0',
          },
        },
      },
      // No release, beta or canary channel: those are Ember 7, which ships as
      // a v2 addon the classic ember-cli build of the dummy app cannot load.
      // Bring them back once the dummy app builds with Vite.
      embroiderSafe(),
      embroiderOptimized(),
    ],
  };
};
