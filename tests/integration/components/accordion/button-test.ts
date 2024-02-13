import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | accordion/button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`{{! @glint-ignore}}
    <Accordion::Button />`);

    assert.dom().hasText('');

    // Template block usage:
    await render(hbs`
      {{! @glint-ignore}}
      <Accordion::Button>
        template block text
      </Accordion::Button>
    `);

    assert.dom().hasText('template block text');
  });
});
