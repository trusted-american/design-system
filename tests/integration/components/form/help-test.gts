import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormHelp from '@trusted-american/design-system/components/form/help';

module('Integration | Component | form/help', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><FormHelp @text='Test' /></template>);

    assert.dom().hasText('Test');
  });
});
