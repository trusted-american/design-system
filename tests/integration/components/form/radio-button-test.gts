import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormRadioButton from '@trusted-american/design-system/components/form/radio-button';

module('Integration | Component | form/radio-button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function ( assert) {
    assert.expect(1);

    const options = [
      { value: 'one', label: 'One' },
      { value: 'two', label: 'Two' },
    ];
    const selected = undefined;
    const identifier = 'identifier';
    const size = 'sm';
    const color = 'success';
    const onChange = (selected: unknown) => {
      assert.ok(selected);
    };

    await render(<template>
      <FormRadioButton
        @options={{options}}
        @selected={{selected}}
        @identifier={{identifier}}
        @size={{size}}
        @color={{color}}
        @onChange={{onChange}}
      />
    </template>);

    assert.dom('div').hasText('One Two');
  });
});
