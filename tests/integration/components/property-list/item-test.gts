import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { PropertyListItem } from '@trusted-american/design-system';

module('Integration | Component | property-list/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <PropertyListItem @label="Label" @value="Value">
          template block text
        </PropertyListItem>
      </template>,
    );

    assert.dom('dd').hasText('template block text');
  });
});
