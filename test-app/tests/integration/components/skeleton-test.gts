import { module, test } from 'qunit';
import { setupRenderingTest } from 'test-app/tests/helpers';
import { render } from '@ember/test-helpers';
import { Skeleton } from '@trusted-american/design-system';

module('Integration | Component | skeleton', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><Skeleton /></template>);

    assert.dom().hasText('');
  });
});
