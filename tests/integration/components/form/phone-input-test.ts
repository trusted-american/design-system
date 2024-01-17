import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormPhoneInputSignature } from '@trusted-american/design-system/components/form/phone-input';

type Context = FormPhoneInputSignature['Args'] & TestContext;

module('Integration | Component | form/phone-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = '+12223334444';
    this.label = 'Label';
    this.identifier = 'identifier';
    this.required = true;
    this.onChange = () => {
      assert.true(true);
    };

    await render<Context>(hbs`
      <Form::PhoneInput
        @value={{this.value}}
        @label={{this.label}}
        @identifier={{this.identifier}}
        @required={{this.required}}
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('label').hasText('Label *');
    assert.dom('input').hasValue('(222) 333-4444');
    assert
      .dom('.invalid-feedback')
      .hasText('Please provide a valid phone number.');
  });
});
