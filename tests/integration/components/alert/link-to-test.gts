import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { AlertLinkTo } from '@trusted-american/design-system';

module('Integration | Component | alert/link-to', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(<template><AlertLinkTo /></template>);

    assert.dom().hasText('');
  });
});
