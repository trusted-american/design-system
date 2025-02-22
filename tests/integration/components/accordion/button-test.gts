import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Accordion } from '@trusted-american/design-system';

module('Integration | Component | accordion/button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Accordion as |accordion|>
          <accordion.item as |item|>
            <item.button>Button</item.button>
          </accordion.item>
        </Accordion>
      </template>,
    );

    assert.dom().hasText('Button');
  });
});
