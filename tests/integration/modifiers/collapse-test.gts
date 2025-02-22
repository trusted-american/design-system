import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';
import { collapse } from '@trusted-american/design-system';

module('Integration | Modifier | collapse', function (hooks) {
  setupRenderingTest(hooks);

  // Replace this with your real tests.
  test('it renders', async function (assert) {
    await render(
      <template>
        <div {{collapse "test"}}></div>
      </template>,
    );

    assert.ok(true);
  });
});
