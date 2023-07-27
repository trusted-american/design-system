import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormCheckSignature } from '@trusted-american/design-system/components/form/check';

type Context = FormCheckSignature['Args'] & TestContext;

module('Integration | Component | form/check', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = false;
    this.label = 'Label';
    this.identifier = 'identifier';
    this.inline = false;
    this.switch = false;
    this.help = 'Help';
    // this.helpTooltip = 'Help Tooltip';

    await render<Context>(hbs`
      <Form::Check
        @value={{this.value}}
        @label={{this.label}}
        @identifier={{this.identifier}}
        @inline={{this.inline}}
        @switch={{this.switch}}
        @help={{this.help}}
        @helpTooltip={{this.helpTooltip}}
      />
    `);

    assert.dom('label').hasText('Label');
    assert.dom('.form-text').hasText('Help');
  });
});
