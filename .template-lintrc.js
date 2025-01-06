'use strict';

module.exports = {
  extends: 'recommended',
  rules: {
    'no-at-ember-render-modifiers': false,
    'no-builtin-form-components': false,
    'no-curly-component-invocation': { allow: ['theme'] },
    'no-implicit-this': { allow: ['theme'] },
  },
};
