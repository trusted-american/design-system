import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, fillIn, render, rerender } from '@ember/test-helpers';
import { FormHtmlInput } from '@trusted-american/design-system';
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
          @identifier="identifier"
          @isRequired={{true}}
          @requiredLabel="Required"
          @editorLabel="Editor"
          @codeLabel="Code"
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
    const state = tracked({ value: 'First' });

    await render(
      <template>
        <FormHtmlInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @requiredLabel="Required"
          @editorLabel="Editor"
          @codeLabel="Code"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-value-editor] div').hasText('First');

    state.value = 'Second';
    await rerender();

    assert.dom('[data-test-value-editor] div').hasText('Second');
  });
});
