import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { NavItem } from '@trusted-american/design-system';

module('Integration | Component | nav/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <NavItem @route="index">
          template block text
        </NavItem>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
