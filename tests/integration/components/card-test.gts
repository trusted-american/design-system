import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Card } from '@trusted-american/design-system';

module('Integration | Component | card', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Card as |card|>
          <card.header>
            Header
          </card.header>
          <card.body>
            Body
          </card.body>
          <card.footer>
            Footer
          </card.footer>
        </Card>
      </template>,
    );

    assert.dom().hasText('Header Body Footer');
  });
});
