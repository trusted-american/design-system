import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { ListGroup, ListGroupItem } from '@trusted-american/design-system';

module('Integration | Component | list-group', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ListGroup>
          <ListGroupItem class="active" data-test-active>An active item</ListGroupItem>
          <ListGroupItem class="disabled" data-test-disabled>A second item</ListGroupItem>
          <ListGroupItem @route="index" data-test-index>Route</ListGroupItem>
          <ListGroupItem
            @href="https://www.google.com/"
            data-test-href
          >Href</ListGroupItem>
        </ListGroup>
      </template>,
    );

    assert.dom('ul').exists();

    assert.dom('[data-test-active]').exists();
    assert.dom('[data-test-disabled]').exists();
    assert.dom('[data-test-disabled]').hasClass('disabled');
    assert.dom('[data-test-index]').exists();
    assert.dom('[data-test-href]').exists();

    assert.dom().hasText('An active item A second item Route Href');
  });
});
