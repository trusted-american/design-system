import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormInputSignature } from '@trusted-american/design-system/components/form/input';

type Context = FormInputSignature['Args'] & TestContext;

module('Integration | Component | form/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = 'Value';

    await render<Context>(hbs`
      <Form::Input
        @value={{this.value}}
        @type='text'
        @label='Label'
        @identifier='identifier'
        @required={{true}}
        @help='Provide any value you would like.'
        @invalidFeedback='Please provide a value.'
      />
    `);

    assert.dom('label').hasText('Label *');
    assert.dom('input').exists();
    assert.dom('.invalid-feedback').hasText('Please provide a value.');
    assert.dom('.form-text').hasText('Provide any value you would like.');
  });
});
