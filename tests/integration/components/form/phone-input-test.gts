import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormPhoneInput from '@trusted-american/design-system/components/form/phone-input';


module('Integration | Component | form/phone-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.expect(3);

    const value = '+12223334444';
    const label = 'Label';
    const identifier = 'identifier';
    const required = true;
    const onChange = () => {
      assert.true(true);
    };

    await render(<template>
      <FormPhoneInput
        @value={{value}}
        @label={{label}}
        @identifier={{identifier}}
        @required={{required}}
        @onChange={{onChange}}
      />
    </template>);

    assert.dom('label').hasText('Label *');
    assert.dom('input').hasValue('(222) 333-4444');
    assert
      .dom('.invalid-feedback')
      .hasText('Please provide a valid phone number.');
  });
});
