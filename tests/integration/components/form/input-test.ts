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
        @isRequired={{true}}
        @help='Help'
        @invalidFeedback='Invalid feedback'
        @onChange={{fn (mut this.value)}}
      />
    `);

    assert.dom('[data-test-form-label]').exists();
    assert.dom('input').hasAttribute('id', 'identifier');
    assert.dom('input').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();
  });
});
