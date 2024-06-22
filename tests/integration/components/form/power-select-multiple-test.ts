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
      this.onChange = (selected: string[]) => {
        assert.deepEqual(selected, ['a']);
      };

      await render<Context>(hbs`
        <Form::PowerSelectMultiple
          @options={{array 'a' 'c' 'b'}}
          @selected={{(array)}}
          @label='Label'
          @identifier='identifier'
          @onChange={{this.onChange}}
          @onCreate={{(noop)}}
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