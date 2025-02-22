import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import { FormHtmlInput } from '@trusted-american/design-system';

module('Integration | Component | form/html-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const onChange = () => {};

    await render(
      <template>
        <FormHtmlInput
          @value="value"
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @editorLabel="Editor"
          @codeLabel="Code"
          @onChange={{onChange}}
        />
      </template>,
    );

    assert.dom().includesText('Label Required');

    assert.dom('[data-test-value-editor]').exists();
    assert.dom('[data-test-form-textarea]').doesNotExist();

    await click('[data-test-code]');

    assert.dom('[data-test-value-editor]').doesNotExist();
    assert.dom('[data-test-form-textarea]').exists();
  });
});
