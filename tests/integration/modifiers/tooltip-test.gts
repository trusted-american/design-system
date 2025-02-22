import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';
import { tooltip } from '@trusted-american/design-system';

module('Integration | Modifier | tooltip', function (hooks) {
  setupRenderingTest(hooks);

  // Replace this with your real tests.
  test('it renders', async function (assert) {
    await render(
      <template>
        <div {{tooltip "Test"}}></div>
      </template>,
    );

    assert.ok(true);
  });
});
