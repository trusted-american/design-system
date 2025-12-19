import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormCheckInput from '@trusted-american/ember/components/form/check/input';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | form/check/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked value = false;
    }
    const state = new State();

    await render(
      <template>
        <FormCheckInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom().hasText('');
  });
});
