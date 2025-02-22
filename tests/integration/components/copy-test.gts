import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Copy } from '@trusted-american/design-system';

module('Integration | Component | copy', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Copy @label="Label">
          template block text
        </Copy>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
