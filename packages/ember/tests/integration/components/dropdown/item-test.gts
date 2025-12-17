import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { DropdownItem } from '@trusted-american/ember';
import { faPlus } from '@fortawesome/free-solid-svg-icons';

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

  test('it hides icon', async function (assert) {
    await render(
      <template>
        <DropdownItem
          @icon={{faPlus}}
          @isIconHidden={{true}}
        >Label</DropdownItem>
      </template>,
    );

    assert
      .dom('[data-test-dropdown-item] [data-test-icon]')
      .hasClass('invisible');
  });
});
