import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormPowerSelect } from '@trusted-american/design-system';
import { selectChoose } from 'ember-power-select/test-support';

module('Integration | Component | form/power-select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const options = ['a', 'c', 'b'];
    const selected = null;
    const onChange = (selected: string) => {
      assert.strictEqual(selected, 'a');
    };

    await render(
      <template>
        <FormPowerSelect
          @options={{options}}
          @selected={{selected}}
          @label="Label"
          @identifier="identifier"
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{onChange}}
          as |option|
        >
          {{option}}
        </FormPowerSelect>
      </template>,
    );

    assert.dom().hasText('Label Choose…');

    await selectChoose('#identifier', '.ember-power-select-option', 0);
  });
});
