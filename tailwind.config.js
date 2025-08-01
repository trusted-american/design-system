'use strict';

const plugin = require('tailwindcss/plugin');

module.exports = {
  content: [
    './addon/**/*.{gjs,gts,hbs,html,js,ts}',
    './tests/dummy/app/**/*.{gjs,gts,hbs,html,js,ts}',
  ],
  theme: {
    extend: {},
  },
  plugins: [
    plugin(function ({ addVariant }) {
      addVariant('ember-active', '&.active');
    }),
  ],
};
