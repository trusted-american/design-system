import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Main } from '@trusted-american/design-system';

module('Integration | Component | main', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Main>
          template block text
        </Main>
      </template>,
    );

    assert.dom('main').hasText('template block text');
  });
});
