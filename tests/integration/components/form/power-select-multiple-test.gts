import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormPowerSelectMultiple } from '@trusted-american/design-system';
import { selectChoose } from 'ember-power-select/test-support';
import { tracked } from 'tracked-built-ins';
import { fn } from '@ember/helper';

module(
  'Integration | Component | form/power-select-multiple',
  function (hooks) {
    setupRenderingTest(hooks);

    test('it renders', async function (assert) {
      const options = ['a', 'c', 'b'];
      const onCreate = () => {
        assert.ok(true);
      };

      const state = tracked<{ selected: string[] }>({ selected: [] });

      await render(
        <template>
          <FormPowerSelectMultiple
            @options={{options}}
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
