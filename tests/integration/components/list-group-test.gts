import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { ListGroup } from '@trusted-american/design-system';

module('Integration | Component | list-group', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ListGroup as |listGroup|>
          <listGroup.item class="active" data-test-active>An active item</listGroup.item>
          <listGroup.item class="disabled" data-test-disabled>A second item</listGroup.item>
          <listGroup.item @route="index" data-test-index>Route</listGroup.item>
          <listGroup.item
            @href="https://www.google.com/"
            data-test-href
          >Href</listGroup.item>
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
