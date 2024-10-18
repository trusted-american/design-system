import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormRadioButtonSignature } from '@trusted-american/design-system/components/form/radio-button';

type Context = FormRadioButtonSignature<unknown>['Args'] & TestContext;

module('Integration | Component | form/radio-button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.options = [
      { value: 'one', label: 'One', color: 'success' },
      { value: 'two', label: 'Two' },
    ];
    this.selected = undefined;
    this.onChange = (selected) => {
      assert.ok(selected);
    };

    await render<Context>(hbs`
      <Form::RadioButton
        @options={{this.options}}
        @selected={{this.selected}}
        @identifier='identifier'
        @size='sm'
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('div').hasText('One Two');
  });
});
