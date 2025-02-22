import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';
import tdsDidInsert from '@trusted-american/design-system/modifiers/tds-did-insert';
import { noop } from '@nullvoxpopuli/ember-composable-helpers';

module('Integration | Modifier | tds-did-insert', function (hooks) {
  setupRenderingTest(hooks);

  // Replace this with your real tests.
  test('it renders', async function (assert) {
    await render(
      <template>
        <div {{tdsDidInsert (noop)}}></div>
      </template>,
    );

    assert.ok(true);
  });
});
