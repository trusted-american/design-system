import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { fillIn, render } from '@ember/test-helpers';
import { FormTimeInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | form/time-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked value: Date | null = null;
    }
    const state = new State();

    await render(
      <template>
        <FormTimeInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidLabel="Invalid feedback"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').exists();

    await fillIn('[data-test-form-time-input]', '01:23');

    assert.strictEqual(state.value?.getHours(), 1);
    assert.strictEqual(state.value?.getMinutes(), 23);
  });
});
