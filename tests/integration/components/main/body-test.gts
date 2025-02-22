import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { MainBody } from '@trusted-american/design-system';

type Context = TestContext;

module('Integration | Component | main/body', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <MainBody>
          template block text
        </MainBody>
      </template>,
    );

    assert.dom('article').hasText('template block text');
    assert.dom('article').hasClass('container-fluid');
  });
});
