import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';
import { selectFiles } from 'ember-file-upload/test-support';

module('Integration | Component | form/file-dropzone', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`<Form::FileDropzone @onCreate={{(noop)}} />`);

    assert.dom().includesText('Drag and Drop Your Files Here');

    const file = new File(['Ember Rules!'], 'ember-rules.pdf', {
      type: 'application/pdf',
    });
    await selectFiles('input[type=file]', file);
  });
});
