import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, fillIn, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormPhoneInputSignature } from '@trusted-american/design-system/components/form/phone-input';

type Context = FormPhoneInputSignature['Args'] & TestContext;

module('Integration | Component | form/phone-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render<Context>(hbs`
      <Form::PhoneInput
        @value={{this.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="Help"
        @invalidFeedback="Invalid feedback"
        @onChange={{fn (mut this.value)}}
      />
    `);

    assert.dom('[data-test-form-input]').exists();

    await fillIn('[data-test-form-input]', '2223334444');

    assert.strictEqual(this.value, '+12223334444');
  });
});
