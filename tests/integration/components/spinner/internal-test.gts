import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import SpinnerInternal from '@trusted-american/design-system/components/spinner/internal';

module('Integration | Component | spinner/internal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><SpinnerInternal /></template>);
    assert.dom('.spinner-border').exists();
  });
});
