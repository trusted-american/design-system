import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormPowerSelectMultiple } from '@trusted-american/design-system';
import { selectChoose } from 'ember-power-select/test-support';

module(
  'Integration | Component | form/power-select-multiple',
  function (hooks) {
    setupRenderingTest(hooks);

    test('it renders', async function (assert) {
      const options = ['a', 'c', 'b'];
      const selected: string[] = [];
      const onChange = (selected: string[]) => {
        assert.deepEqual(selected, ['a']);
      };
      const onCreate = () => {
        assert.ok(true);
      };

      await render(
        <template>
          <FormPowerSelectMultiple
            @options={{options}}
            @selected={{selected}}
            @label="Label"
            @identifier="identifier"
            @requiredLabel="Required"
            @chooseLabel="Choose…"
            @onChange={{onChange}}
            @onCreate={{onCreate}}
            as |option|
          >
            {{option}}
          </FormPowerSelectMultiple>
        </template>,
      );

      assert.dom().hasText('Label');

      await selectChoose('#identifier', '.ember-power-select-option', 0);
    });
  },
);
