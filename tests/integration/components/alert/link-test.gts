import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { AlertLink } from '@trusted-american/design-system';

module('Integration | Component | alert/link', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><AlertLink @label="Label" /></template>);

    assert.dom('[data-test-alert-link]').hasText('Label');
  });
});
