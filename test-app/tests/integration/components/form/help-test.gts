import { module, test } from 'qunit';
import { setupRenderingTest } from 'test-app/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormHelp } from '@trusted-american/design-system';

module('Integration | Component | form/help', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><FormHelp @label="Label" /></template>);

    assert.dom('.form-text').hasText('Label');
  });
});
