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

    await render<Context>(
      <template>
        <Form::DateInput
          @value={{this.value}}
          @min={{this.min}}
          @max={{this.max}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidFeedback="Invalid feedback"
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').exists();
    assert.dom('[data-test-form-input]').hasAttribute('type', 'date');

    await fillIn('[data-test-form-input]', '2014-09-13');

    assert.strictEqual(
      this.value.toISOString(),
      new Date(Date.UTC(2014, 8, 13)).toISOString(),
    );
  });
});
