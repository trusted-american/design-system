import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import NavItemInternal from '@trusted-american/design-system/components/nav/item/internal';

module('Integration | Component | nav/item/internal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <NavItemInternal>
          template block text
        </NavItemInternal>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
