import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import CardFooter from '@trusted-american/ember/components/card/footer';

module('Integration | Component | card/footer', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <CardFooter>
          template block text
        </CardFooter>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
