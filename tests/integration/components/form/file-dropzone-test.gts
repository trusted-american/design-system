import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';
import { selectFiles } from 'ember-file-upload/test-support';

import type { FormFileDropzoneSignature } from '@trusted-american/design-system/components/form/file-dropzone';

type Context = FormFileDropzoneSignature['Args'] & TestContext;

module('Integration | Component | form/file-dropzone', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.onCreate = () => {};

    await render<Context>(hbs`
      <Form::FileDropzone
        @titleLabel=""
        @subtitleLabel=""
        @activeTitleLabel=""
        @onCreate={{this.onCreate}}
      />
    `);

    assert.dom('.form-file-dropzone').exists();

    const file = new File(['Ember Rules!'], 'ember-rules.pdf', {
      type: 'application/pdf',
    });
    await selectFiles('input[type=file]', file);
  });
});
