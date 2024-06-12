import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { fillIn, render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormNumberInputSignature } from '@trusted-american/design-system/components/form/number-input';

type Context = FormNumberInputSignature['Args'] & TestContext;

module('Integration | Component | form/number-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<Context>(hbs`
      <Form::NumberInput
        @value={{this.value}}
        @label='Label'
        @identifier='identifier'
        @isRequired={{true}}
        @help='Help'
        @invalidFeedback='Invalid feedback'
        @onChange={{fn (mut this.value)}}
        placeholder='Placeholder'
      />
    `);

    assert.dom('[data-test-form-label]').exists();
    assert.dom('input').hasAttribute('id', 'identifier');
    assert.dom('input').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();

    await fillIn('input', '1');
    // @ts-expect-error TestContext
    assert.strictEqual(this.value, 1);

    await fillIn('input', '1.01');
    // @ts-expect-error TestContext
    assert.strictEqual(this.value, 1.01);
  });
});
