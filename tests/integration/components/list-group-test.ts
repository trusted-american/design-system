import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | list-group', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<ListGroup />`);

    assert.dom().hasText('');

    // Template block usage:
    await render(hbs`
      <ListGroup>
        <ListGroup::Item class="active" data-test-active>An active item</ListGroup::Item>
        <ListGroup::Item class="disabled" data-test-disabled>A second item</ListGroup::Item>
        <ListGroup::Item @route="index" data-test-index>Route</ListGroup::Item>
        <ListGroup::Item @href="https://www.google.com/" data-test-href>Href</ListGroup::Item>
      </ListGroup>
    `);

    assert.dom('[data-test-active]').exists();
    assert.dom('[data-test-disabled]').exists();
    assert.dom('[data-test-disabled]').hasClass('disabled');
    assert.dom('[data-test-index]').exists();
    assert.dom('[data-test-href]').exists();

    assert.dom().hasText('An active item A second item Route Href');
  });
});
