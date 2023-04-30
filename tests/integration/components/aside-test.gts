import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import Aside from '@trusted-american/design-system/components/aside';

module('Integration | Component | aside', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template>
      <Aside @title='Title' @logo='' @route=''>
        <:default>
          Default
        </:default>
        <:bottom>
          Bottom
        </:bottom>
      </Aside>
    </template>);

    assert.dom('aside').hasText('Title Default Bottom');
  });
});
