import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';
import { selectChoose } from 'ember-power-select/test-support';

import type { FormPowerSelectSignature } from '@trusted-american/design-system/components/form/power-select';

type Context = FormPowerSelectSignature<string>['Args'] & TestContext;

module('Integration | Component | form/power-select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.onChange = (selected: string) => {
      assert.strictEqual(selected, 'a');
    };

    await render<Context>(hbs`
      <Form::PowerSelect
        @options={{array 'a' 'c' 'b'}}
        @selected={{null}}
        @label='Label'
        @identifier='identifier'
        @onChange={{this.onChange}}
        as |option|
      >
        {{option}}
      </Form::PowerSelect>
    `);

    assert.dom().hasText('Label Choose…');

    await selectChoose('#identifier', '.ember-power-select-option', 0);
  });
});
