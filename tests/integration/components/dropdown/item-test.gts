import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { DropdownItem } from '@trusted-american/design-system';

module('Integration | Component | dropdown/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><DropdownItem @label="Label" /></template>);

    assert.dom().hasText('Label');
  });

  test('it yields', async function (assert) {
    await render(
      <template>
        <DropdownItem>Label</DropdownItem>
      </template>,
    );

    assert.dom().hasText('Label');
  });
});
