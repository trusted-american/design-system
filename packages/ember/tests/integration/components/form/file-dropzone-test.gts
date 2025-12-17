import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormFileDropzone } from '@trusted-american/design-system';
import { selectFiles } from 'ember-file-upload/test-support';
import { tracked } from '@glimmer/tracking';
import { fn } from '@ember/helper';

module('Integration | Component | form/file-dropzone', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked file?: File;
    }
    const state = new State();

    await render(
      <template>
        <FormFileDropzone
          @titleLabel=""
          @subtitleLabel=""
          @activeTitleLabel=""
          @onCreate={{fn (mut state.file)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-file-dropzone]').exists();

    const file = new File(['Ember Rules!'], 'ember-rules.pdf', {
      type: 'application/pdf',
    });
    await selectFiles('[data-test-form-file-dropzone]', file);

    assert.true(state.file instanceof File);
  });
});
