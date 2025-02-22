import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Spinner } from '@trusted-american/design-system';

module('Integration | Component | spinner', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><Spinner /></template>);

    assert.dom('[data-test-spinner]').exists();
  });
});
