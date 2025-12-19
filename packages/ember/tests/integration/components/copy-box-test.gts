import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import CopyBox from '@trusted-american/ember/components/copy-box';

module('Integration | Component | copy-box', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><CopyBox @value="" /></template>);

    assert.dom().hasText('');
  });
});
