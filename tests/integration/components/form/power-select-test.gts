import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { FormPowerSelect } from '@trusted-american/design-system';
import { selectChoose } from 'ember-power-select/test-support';

import type { FormPowerSelectSignature } from '@trusted-american/design-system/components/form/power-select';

type Context = FormPowerSelectSignature<string>['Args'] & TestContext;

module('Integration | Component | form/power-select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.options = ['a', 'c', 'b'];
    this.selected = null;
    this.onChange = (selected: string) => {
      assert.strictEqual(selected, 'a');
    };

    await render<Context>(
      <template>
        <FormPowerSelect
          @options={{this.options}}
          @selected={{this.selected}}
          @label="Label"
          @identifier="identifier"
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{this.onChange}}
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
