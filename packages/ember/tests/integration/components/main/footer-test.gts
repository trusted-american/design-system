import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { MainFooter } from '@trusted-american/ember';

module('Integration | Component | main/footer', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <MainFooter>
          template block text
        </MainFooter>
      </template>,
    );

    assert.dom('footer').hasText('template block text');
    assert.dom('footer').hasClass('container-fluid');
  });
});
