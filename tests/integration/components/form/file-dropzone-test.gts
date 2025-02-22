import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormFileDropzone } from '@trusted-american/design-system';
import { selectFiles } from 'ember-file-upload/test-support';

module('Integration | Component | form/file-dropzone', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const onCreate = () => {
      assert.ok(true);
    };

    await render(
      <template>
        <FormFileDropzone
          @titleLabel=""
          @subtitleLabel=""
          @activeTitleLabel=""
          @onCreate={{onCreate}}
        />
      </template>,
    );

    assert.dom('.form-file-dropzone').exists();

    const file = new File(['Ember Rules!'], 'ember-rules.pdf', {
      type: 'application/pdf',
    });
    await selectFiles('input[type=file]', file);
  });
});
