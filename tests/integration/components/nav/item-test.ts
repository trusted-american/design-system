import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | nav/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<Nav::Item />`);

    assert.dom().hasText('');

    // Template block usage:
    await render(hbs`
      <Nav::Item>
        template block text
      </Nav::Item>
    `);

    assert.dom().hasText('template block text');
  });
});
