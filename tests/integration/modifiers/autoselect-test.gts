import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';
import { autoselect } from '@trusted-american/design-system';

module('Integration | Modifier | autoselect', function (hooks) {
  setupRenderingTest(hooks);

  // Replace this with your real tests.
  test('it renders', async function (assert) {
    await render(<template><input aria-label="" {{autoselect}} /></template>);

    assert.ok(true);
  });
});
