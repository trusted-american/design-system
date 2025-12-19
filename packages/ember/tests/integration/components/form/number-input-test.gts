import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { fillIn, render } from '@ember/test-helpers';
import FormNumberInput from '@trusted-american/ember/components/form/number-input';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | form/number-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked value: number | null = 0;
    }
    const state = new State();

    await render(
      <template>
        <FormNumberInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidLabel="Invalid feedback"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
          placeholder="Placeholder"
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').exists();
    assert.dom('[data-test-form-input]').hasAttribute('type', 'number');

    await fillIn('[data-test-form-input]', '1');

    assert.strictEqual(state.value, 1);

    await fillIn('[data-test-form-input]', '1.01');

    assert.strictEqual(state.value, 1.01);
  });
});
