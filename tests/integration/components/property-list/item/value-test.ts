import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | property-list/item/value', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <PropertyList::Item::Value
        @value=""
        @label="Label"
        @alt={{false}}
      >
        <:default>Default</:default>
        <:side>Side</:side>
      </PropertyList::Item::Value>
    `);

    assert.dom('dd').hasText('template block text');
  });
});
