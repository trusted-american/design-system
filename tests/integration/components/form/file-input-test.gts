import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormFileInputSignature } from '@trusted-american/design-system/components/form/file-input';

type Context = FormFileInputSignature['Args'] & TestContext;

module('Integration | Component | form/file-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.onChange = () => {
      assert.true(true);
    };

    await render<Context>(hbs`
      <Form::FileInput
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="Help"
        @invalidFeedback="Invalid feedback"
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('[data-test-form-label]').exists();
    assert.dom('input').hasAttribute('id', 'identifier');
    assert.dom('input').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();
  });
});
