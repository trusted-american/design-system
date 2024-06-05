import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormCheckSignature } from '@trusted-american/design-system/components/form/check';

type Context = FormCheckSignature['Args'] & TestContext;

module('Integration | Component | form/check', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = false;

    await render<Context>(hbs`
      <Form::Check
        @value={{this.value}}
        @label='Label'
        @identifier='identifier'
        @isInline={{false}}
        @isSwitch={{false}}
        @help='Help'
      />
    `);

    assert.dom('label').hasText('Label');
    assert.dom('[data-test-form-help]').exists();
  });
});
