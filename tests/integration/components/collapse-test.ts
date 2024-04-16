import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | collapse', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<Collapse />`);

    assert.dom().hasText('');

    // Template block usage:
    await render(hbs`
      <Collapse>
        template block text
      </Collapse>
    `);

    assert.dom().hasText('template block text');
  });
});
