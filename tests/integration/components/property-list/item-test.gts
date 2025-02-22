import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | property-list/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template>
      <PropertyList::Item @label="Label" @value="Value">
        template block text
      </PropertyList::Item>
    </template>);

    assert.dom('dd').hasText('template block text');
  });
});
