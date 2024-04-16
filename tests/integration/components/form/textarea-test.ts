import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormTextareaSignature } from '@trusted-american/design-system/components/form/textarea';

type Context = FormTextareaSignature['Args'] & TestContext;

module('Integration | Component | form/textarea', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = 'Value';
    this.required = true;

    await render<Context>(hbs`
      <Form::Textarea
        @value={{this.value}}
        @label='Label'
        @identifier='identifier'
        @required={{this.required}}
        @help='Help'
        @invalidFeedback='Invalid feedback'
      />
    `);

    assert.dom('[data-test-form-label]').exists();
    assert.dom('textarea').hasAttribute('id', 'identifier');
    assert.dom('textarea').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();

    this.set('required', false);

    assert.dom('textarea').isNotRequired();
  });
});
