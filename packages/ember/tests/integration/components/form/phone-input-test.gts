import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { fillIn, render } from '@ember/test-helpers';
import { FormPhoneInput } from '@trusted-american/ember';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | form/phone-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked value: string | null = '';
    }
    const state = new State();

    await render(
      <template>
        <FormPhoneInput
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

    await fillIn('[data-test-form-phone-input]', '2223334444');

    assert.strictEqual(state.value, '+12223334444');
  });
});
