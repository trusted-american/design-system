import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { CardHeader } from '@trusted-american/design-system';

module('Integration | Component | card/header', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <CardHeader>
          template block text
        </CardHeader>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
