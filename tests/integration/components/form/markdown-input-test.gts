import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { fillIn, render } from '@ember/test-helpers';
import { FormMarkdownInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | form/markdown-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked({ value: '' });

    await render(
      <template>
        <FormMarkdownInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidLabel="Invalid feedback"
          @requiredLabel="Required"
          @writeLabel="Write"
          @previewLabel="Preview"
          @headingLabel="Heading"
          @boldLabel="Bold"
          @italicLabel="Italic"
          @codeLabel="Code"
          @linkLabel="Link"
          @numberedListLabel="Numbered list"
          @unorderedListLabel="Unordered list"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    await fillIn('[data-test-form-textarea]', 'test');

    assert.strictEqual(state.value, 'test');
  });
});
