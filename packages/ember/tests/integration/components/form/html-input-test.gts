import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, fillIn, render, rerender, typeIn } from '@ember/test-helpers';
import FormHtmlInput from '@trusted-american/ember/components/form/html-input';
import { tracked } from '@glimmer/tracking';
import { fn } from '@ember/helper';

module('Integration | Component | form/html-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked value = '';
    }
    const state = new State();

    await render(
      <template>
        <FormHtmlInput
          @value={{state.value}}
          @label="Label"
          @id="identifier"
          @isRequired={{true}}
          @requiredLabel="Required"
          @editorLabel="Editor"
          @codeLabel="Code"
          @boldButtonLabel="Bold"
          @italicButtonLabel="Italic"
          @strikeButtonLabel="Strike"
          @headingButtonLabel="Heading"
          @paragraphButtonLabel="Paragraph"
          @quoteButtonLabel="Quote"
          @numberedListButtonLabel="Numbered list"
          @unorderedListButtonLabel="Unordered list"
          @codeButtonLabel="Code"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom().includesText('Label Required');

    assert.dom('[data-test-value-editor]').exists();
    assert.dom('[data-test-form-textarea]').doesNotExist();

    await click('[data-test-code]');

    assert.dom('[data-test-value-editor]').doesNotExist();
    assert.dom('[data-test-form-textarea]').exists();

    await click('[data-test-editor]');

    await fillIn('[data-test-value-editor] div', 'Value');

    assert.strictEqual(state.value, '<p>Value</p>');
  });

  test('it updates when value arg changes', async function (assert) {
    class State {
      @tracked value = 'First';
    }
    const state = new State();

    await render(
      <template>
        <FormHtmlInput
          @value={{state.value}}
          @label="Label"
          @id="identifier"
          @isRequired={{true}}
          @requiredLabel="Required"
          @editorLabel="Editor"
          @codeLabel="Code"
          @boldButtonLabel="Bold"
          @italicButtonLabel="Italic"
          @strikeButtonLabel="Strike"
          @headingButtonLabel="Heading"
          @paragraphButtonLabel="Paragraph"
          @quoteButtonLabel="Quote"
          @numberedListButtonLabel="Numbered list"
          @unorderedListButtonLabel="Unordered list"
          @codeButtonLabel="Code"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-value-editor] div').hasText('First');

    state.value = 'Second';
    await rerender();

    assert.dom('[data-test-value-editor] div').hasText('Second');
  });

  test('it works with human typing', async function (assert) {
    class State {
      @tracked value = '';
    }
    const state = new State();

    await render(
      <template>
        <FormHtmlInput
          @value={{state.value}}
          @label="Label"
          @id="identifier"
          @isRequired={{true}}
          @requiredLabel="Required"
          @editorLabel="Editor"
          @codeLabel="Code"
          @boldButtonLabel="Bold"
          @italicButtonLabel="Italic"
          @strikeButtonLabel="Strike"
          @headingButtonLabel="Heading"
          @paragraphButtonLabel="Paragraph"
          @quoteButtonLabel="Quote"
          @numberedListButtonLabel="Numbered list"
          @unorderedListButtonLabel="Unordered list"
          @codeButtonLabel="Code"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    await typeIn('[data-test-value-editor] div', 'Value');

    assert.strictEqual(
      state.value,
      '<p></p><p>V</p><p>a</p><p>l</p><p>u</p><p>e</p>',
    );
  });
});
