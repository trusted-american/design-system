import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import FormCheck from '@trusted-american/ember/components/form/check';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | form/check', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked value = false;
    }
    const state = new State();

    await render(
      <template>
        <FormCheck
          @value={{state.value}}
          @label="Label"
          @id="identifier"
          @isInline={{false}}
          @isSwitch={{false}}
          @help="Help"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('label').hasText('Label');
    assert.dom('[data-test-form-help]').exists();

    await click('input');

    assert.true(state.value);

    await click('input');

    assert.false(state.value);
  });
});
