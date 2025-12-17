import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormFeedback } from '@trusted-american/ember';

module('Integration | Component | form/feedback', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <FormFeedback @validLabel="Looks good!" @invalidLabel="Label" />
      </template>,
    );

    assert.dom('.invalid-feedback').hasText('Label');
  });
});
