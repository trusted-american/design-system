import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Collapse } from '@trusted-american/design-system';

module('Integration | Component | collapse', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Collapse>
          template block text
        </Collapse>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
