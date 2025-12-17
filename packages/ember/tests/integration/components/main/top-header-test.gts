import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { MainTopHeader } from '@trusted-american/ember';

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
