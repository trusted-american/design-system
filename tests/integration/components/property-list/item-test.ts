import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | property-list/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<PropertyList::Item @key="Key" />`);

    assert.dom('dd').hasText('');

    // Template block usage:
    await render(hbs`
      <PropertyList::Item @key="Key">
        template block text
      </PropertyList::Item>
    `);

    assert.dom('dd').hasText('template block text');
  });
});
