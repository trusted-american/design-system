import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import Accordion from '@trusted-american/ember/components/accordion';

module('Integration | Component | accordion/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Accordion as |accordion|>
          <accordion.item>Item</accordion.item>
        </Accordion>
      </template>,
    );

    assert.dom().hasText('Item Item');
  });
});
