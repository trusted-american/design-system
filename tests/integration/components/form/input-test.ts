import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormInputComponentSignature } from '@trusted-american/design-system/components/form/input';

type Context = FormInputComponentSignature['Args'] & TestContext;

module('Integration | Component | form/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = 'Value';
    this.type = 'text';
    this.label = 'Label';
    this.help = 'Provide any value you would like.';
    this.invalidFeedback = 'Please provide a value.';
    this.identifier = 'identifier';
    this.required = true;

    await render(hbs`
      <Form::Input
        @value={{this.value}}
        @type={{this.type}}
        @label={{this.label}}
        @help={{this.help}}
        @invalidFeedback={{this.invalidFeedback}}
        @identifier={{this.identifier}}
        @required={{this.required}}
      />
    `);

    assert.dom('label').hasText('Label *');
    assert.dom('input').exists();
    assert.dom('.invalid-feedback').hasText('Please provide a value.');
    assert.dom('.form-text').hasText('Provide any value you would like.');
  });
});
