import { module, test } from 'qunit';
import { setupRenderingTest } from 'test-app/tests/helpers';
import { render } from '@ember/test-helpers';
import { MainTopHeader } from '@trusted-american/design-system';

module('Integration | Component | main/top-header', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <MainTopHeader>
          template block text
        </MainTopHeader>
      </template>,
    );

    assert.dom('header').hasText('template block text');
  });
});
