import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { find, render } from '@ember/test-helpers';
import { tooltip } from '@trusted-american/design-system';
import { Tooltip } from 'bootstrap';

module('Integration | Modifier | tooltip', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <div {{tooltip "Test"}}></div>
      </template>,
    );

    assert.ok(Tooltip.getInstance(find('div')!));
  });
});
