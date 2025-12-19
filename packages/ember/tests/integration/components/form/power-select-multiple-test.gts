import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormPowerSelectMultiple from '@trusted-american/ember/components/form/power-select-multiple';
import { selectChoose } from 'ember-power-select/test-support';
import { tracked } from '@glimmer/tracking';
import { array, fn } from '@ember/helper';

module(
  'Integration | Component | form/power-select-multiple',
  function (hooks) {
    setupRenderingTest(hooks);

    test('it renders', async function (assert) {
      const onCreate = () => {
        assert.ok(true);
      };

      class State {
        @tracked selected: string[] = [];
      }
      const state = new State();

      await render(
        <template>
          <FormPowerSelectMultiple
            @options={{array "a" "b" "c"}}
            @selected={{state.selected}}
            @label="Label"
            @identifier="identifier"
            @requiredLabel="Required"
            @chooseLabel="Choose…"
            @onChange={{fn (mut state.selected)}}
            @onCreate={{onCreate}}
            as |option|
          >
            {{option}}
          </FormPowerSelectMultiple>
        </template>,
      );

      assert.dom().hasText('Label');

      await selectChoose('#identifier', '.ember-power-select-option', 0);

      assert.deepEqual(state.selected, ['a']);
    });
  },
);
