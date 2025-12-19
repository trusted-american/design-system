import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import CloseButton from '@trusted-american/ember/components/close-button';

module('Integration | Component | close-button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><CloseButton @label="Label" /></template>);

    assert.dom('[data-test-close-button]').exists();
    assert.dom('[data-test-close-button]').hasAttribute('aria-label', 'Label');
  });
});
