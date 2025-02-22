import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { fillIn, render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormNumberInputSignature } from '@trusted-american/design-system/components/form/number-input';

type Context = FormNumberInputSignature['Args'] & TestContext;

module('Integration | Component | form/number-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render<Context>(
      <template>
        <Form::NumberInput
          @value={{this.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidFeedback="Invalid feedback"
          @onChange={{fn (mut this.value)}}
          placeholder="Placeholder"
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').exists();
    assert.dom('[data-test-form-input]').hasAttribute('type', 'number');

    await fillIn('[data-test-form-input]', '1');

    assert.strictEqual(this.value, 1);

    await fillIn('[data-test-form-input]', '1.01');

    assert.strictEqual(this.value, 1.01);
  });
});
