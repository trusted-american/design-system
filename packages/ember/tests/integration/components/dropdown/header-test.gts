import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import DropdownHeader from '@trusted-american/ember/components/dropdown/header';

module('Integration | Component | dropdown/header', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><DropdownHeader @label="Label" /></template>);

    assert.dom().hasText('Label');
  });
});
