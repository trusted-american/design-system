import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { AsideTitle } from '@trusted-american/ember';

module('Integration | Component | aside/title', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><AsideTitle @label="Label" /></template>);

    assert.dom().hasText('Label');
  });
});
