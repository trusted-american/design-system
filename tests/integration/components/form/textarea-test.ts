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
    this.label = 'Label';
    this.identifier = 'identifier';
    this.required = true;

    await render<Context>(hbs`
      <Form::Textarea
        @value={{this.value}}
        @label={{this.label}}
        @identifier={{this.identifier}}
        @required={{this.required}}
      />
    `);

    assert.dom('label').hasText('Label *');

    this.set('required', false);

    assert.dom('label').hasText('Label');
  });
});
