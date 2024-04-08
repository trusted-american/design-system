import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | accordion/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Accordion as |accordion|>
        <accordion.item>Item</accordion.item>
      </Accordion>
    `);

    assert.dom().hasText('Item Item');
  });
});
