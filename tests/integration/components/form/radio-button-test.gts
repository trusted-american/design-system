import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormRadioButton } from '@trusted-american/design-system';

module('Integration | Component | form/radio-button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const options = [
      { value: 'one', label: 'One', color: 'success' },
      { value: 'two', label: 'Two' },
    ];
    const selected = undefined;
    const onChange = (selected: unknown) => {
      assert.ok(selected);
    };

    await render(
      <template>
        <FormRadioButton
          @options={{options}}
          @selected={{selected}}
          @label="Label"
          @identifier="identifier"
          @size="sm"
          @onChange={{onChange}}
        />
      </template>,
    );

    assert.dom('div').hasText('One Two');
  });
});
