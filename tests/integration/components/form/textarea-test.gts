import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { fillIn, render, rerender } from '@ember/test-helpers';
import { FormTextarea } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | form/textarea', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked value = 'Value';
      @tracked isRequired = true;
    }
    const state = new State();

    await render(
      <template>
        <FormTextarea
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{state.isRequired}}
          @help="Help"
          @invalidLabel="Invalid feedback"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('[data-test-form-textarea]').hasAttribute('id', 'identifier');
    assert.dom('[data-test-form-textarea]').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-feedback]').exists();

    state.isRequired = false;
    await rerender();

    assert.dom('[data-test-form-textarea]').isNotRequired();

    await fillIn('[data-test-form-textarea]', 'test');

    assert.strictEqual(state.value, 'test');
  });
});
