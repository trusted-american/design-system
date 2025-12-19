import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import MainHeader from '@trusted-american/ember/components/main/header';

module('Integration | Component | main/header', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <MainHeader>
          template block text
        </MainHeader>
      </template>,
    );

    assert.dom('header').hasText('template block text');
    assert.dom('header').hasClass('container-fluid');
  });
});
