import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | property-list', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<PropertyList />`);

    assert.dom('div').hasText('');

    // Template block usage:
    await render(hbs`
      <PropertyList>
        template block text
      </PropertyList>
    `);

    assert.dom('div').hasText('template block text');
  });
});
