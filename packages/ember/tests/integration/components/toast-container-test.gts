import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import ToastContainer from '@trusted-american/ember/components/toast-container';

module('Integration | Component | toast-container', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ToastContainer>
          template block text
        </ToastContainer>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
