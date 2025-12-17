import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import PropertyListItemKey from '@trusted-american/ember/components/property-list/item/key';

module('Integration | Component | property-list/item/key', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template><PropertyListItemKey @label="Label" @help="Help" /></template>,
    );

    assert.dom('dt').hasText('Label');
  });
});
