import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Frame } from '@trusted-american/ember';

module('Integration | Component | frame', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Frame>
          template block text
        </Frame>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
