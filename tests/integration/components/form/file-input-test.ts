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
        @label='Label'
        @identifier='identifier'
        @required={{true}}
        @invalidFeedback='Please provide a file.'
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('label').hasText('Label *');
    assert.dom('.invalid-feedback').hasText('Please provide a file.');
  });
});
