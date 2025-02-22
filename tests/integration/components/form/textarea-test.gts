import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, fillIn, type TestContext } from '@ember/test-helpers';
import { FormTextarea } from '@trusted-american/design-system';
import { fn } from '@ember/helper';

import type { FormTextareaSignature } from '@trusted-american/design-system/components/form/textarea';

type Context = FormTextareaSignature['Args'] & TestContext;

module('Integration | Component | form/textarea', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = 'Value';
    this.isRequired = true;

    await render<Context>(
      <template>
        <FormTextarea
          @value={{this.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{this.isRequired}}
          @help="Help"
          @invalidFeedback="Invalid feedback"
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('[data-test-form-textarea]').hasAttribute('id', 'identifier');
    assert.dom('[data-test-form-textarea]').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();

    this.set('isRequired', false);

    assert.dom('[data-test-form-textarea]').isNotRequired();

    await fillIn('[data-test-form-textarea]', 'test');

    assert.strictEqual(this.value, 'test');
  });
});
