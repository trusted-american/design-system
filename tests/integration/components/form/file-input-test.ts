import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormFileInputComponentSignature } from '@trusted-american/design-system/components/form/file-input';

type Context = FormFileInputComponentSignature['Args'] & TestContext;

module('Integration | Component | form/file-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    assert.expect(2);

    this.label = 'Label';
    this.identifier = 'identifier';
    this.required = true;
    this.invalidFeedback = 'Please provide a file.';
    this.onChange = () => {
      assert.true(true);
    };

    await render(hbs`
      <Form::FileInput
        @label={{this.label}}
        @identifier={{this.identifier}}
        @required={{this.required}}
        @invalidFeedback={{this.invalidFeedback}}
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('label').hasText('Label *');
    assert.dom('.invalid-feedback').hasText('Please provide a file.');
  });
});
