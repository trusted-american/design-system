import { module, test } from 'qunit';
import { setupRenderingTest } from 'test-app/tests/helpers';
import { render } from '@ember/test-helpers';
import PropertyListItemValue from '@trusted-american/design-system/components/property-list/item/value';

module('Integration | Component | property-list/item/value', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <PropertyListItemValue
          @value=""
          @label="Label"
          @noLabel="No"
          @copyLabel="Copy"
          @copiedLabel="Copied!"
        >
          <:default>Default</:default>
          <:trailing>Trailing</:trailing>
        </PropertyListItemValue>
      </template>,
    );

    assert.dom('dd').hasText('No Label');
  });
});
