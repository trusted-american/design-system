import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { CloseButton } from '@trusted-american/design-system';

module('Integration | Component | close-button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><CloseButton @label="Close" /></template>);

    assert.dom().hasText('');
  });
});
