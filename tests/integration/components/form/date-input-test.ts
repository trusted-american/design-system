import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, fillIn, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormDateInputSignature } from '@trusted-american/design-system/components/form/date-input';

type Context = FormDateInputSignature['Args'] & TestContext;

module('Integration | Component | form/date-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = new Date();
    this.min = undefined;
    this.max = undefined;
    this.onChange = (value) => {
      const date = new Date(2014, 8, 13);
      assert.strictEqual(value?.getTime(), date.getTime());
    };

    await render<Context>(hbs`
      <Form::DateInput
        @value={{this.value}}
        @min={{this.min}}
        @max={{this.max}}
        @label='Label'
        @identifier='identifier'
        @isRequired={{true}}
        @help='Help'
        @invalidFeedback='Invalid feedback'
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('[data-test-form-label]').exists();
    assert.dom('input').hasAttribute('type', 'date');
    assert.dom('input').hasAttribute('id', 'identifier');
    assert.dom('input').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();

    await fillIn('input', '2014-09-13');
  });
});
