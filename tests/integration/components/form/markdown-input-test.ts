import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/markdown-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Form::MarkdownInput
        @value={{this.markdownValue}}
        @label="Label"
        @identifier="markdownInput"
        @isRequired={{true}}
        @help="Help"
        @invalidFeedback="Invalid feedback"
        @onChange={{fn (mut this.markdownValue)}}
      />
    `);

    assert.dom().hasText('');
  });
});
