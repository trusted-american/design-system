import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormFeedback } from '@trusted-american/design-system';

module('Integration | Component | form/feedback', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><FormFeedback @label="Label" /></template>);

    assert.dom('.invalid-feedback').hasText('Label');
  });
});
