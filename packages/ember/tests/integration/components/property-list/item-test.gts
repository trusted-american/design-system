import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import PropertyListItem from '@trusted-american/ember/components/property-list/item';

module('Integration | Component | property-list/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <PropertyListItem
          @label="Label"
          @value="Value"
          @noLabel="No"
          @copyLabel="Copy"
          @copiedLabel="Copied!"
        >
          template block text
        </PropertyListItem>
      </template>,
    );

    assert.dom('dd').hasText('template block text');
  });
});
