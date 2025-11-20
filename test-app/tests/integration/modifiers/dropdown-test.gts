import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';
import { dropdown } from '@trusted-american/design-system';

module('Integration | Modifier | dropdown', function (hooks) {
  setupRenderingTest(hooks);

  // Replace this with your real tests.
  test('it renders', async function (assert) {
    await render(
      <template>
        <div {{dropdown}}></div>
      </template>,
    );

    assert.ok(true);
  });
});
