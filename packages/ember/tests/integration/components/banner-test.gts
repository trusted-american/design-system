import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Banner } from '@trusted-american/ember';

module('Integration | Component | banner', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Banner @color="primary">
          template block text
        </Banner>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
