import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormPowerSelect } from '@trusted-american/design-system';
import { selectChoose } from 'ember-power-select/test-support';
import { tracked } from 'tracked-built-ins';
import { fn } from '@ember/helper';

module('Integration | Component | form/power-select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const options = ['a', 'c', 'b'];

    const state = tracked<{ selected: string | null }>({ selected: null });

    await render(
      <template>
        <FormPowerSelect
          @options={{options}}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{fn (mut state.selected)}}
          as |option|
        >
          {{option}}
        </FormPowerSelect>
      </template>,
    );

    assert.dom().hasText('Label Choose…');

    await selectChoose('#identifier', '.ember-power-select-option', 0);

    assert.strictEqual(state.selected, 'a');
  });
});
