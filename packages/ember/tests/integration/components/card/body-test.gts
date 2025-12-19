import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import CardBody from '@trusted-american/ember/components/card/body';

module('Integration | Component | card/body', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <CardBody>
          template block text
        </CardBody>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
