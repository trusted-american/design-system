import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import DropdownDivider from '@trusted-american/ember/components/dropdown/divider';

module('Integration | Component | dropdown/divider', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><DropdownDivider /></template>);

    assert.dom().hasText('');
  });
});
