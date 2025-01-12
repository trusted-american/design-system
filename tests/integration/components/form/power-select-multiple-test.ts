import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';
import { selectChoose } from 'ember-power-select/test-support';

import type { FormPowerSelectMultipleSignature } from '@trusted-american/design-system/components/form/power-select-multiple';

type Context = FormPowerSelectMultipleSignature<string>['Args'] & TestContext;

module(
  'Integration | Component | form/power-select-multiple',
  function (hooks) {
    setupRenderingTest(hooks);

    test('it renders', async function (this: Context, assert) {
      this.options = ['a', 'c', 'b'];
      this.selected = [];
      this.onChange = (selected: string[]) => {
        assert.deepEqual(selected, ['a']);
      };
      this.onCreate = () => {};

      await render<Context>(hbs`
        <Form::PowerSelectMultiple
          @options={{this.options}}
          @selected={{this.selected}}
          @label="Label"
          @identifier="identifier"
          @chooseText="Choose…"
          @onChange={{this.onChange}}
          @onCreate={{this.onCreate}}
          as |option|
        >
          {{option}}
        </Form::PowerSelectMultiple>
      `);

      assert.dom().hasText('Label');

      await selectChoose('#identifier', '.ember-power-select-option', 0);
    });
  },
);
