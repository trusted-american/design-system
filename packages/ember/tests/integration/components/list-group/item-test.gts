import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { ListGroupItem } from '@trusted-american/ember';

module('Integration | Component | list-group/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ListGroupItem>
          template block text
        </ListGroupItem>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
