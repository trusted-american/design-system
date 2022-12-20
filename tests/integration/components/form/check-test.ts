import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormCheckComponentSignature } from '@trusted-american/design-system/components/form/check';

type Context = FormCheckComponentSignature['Args'] & TestContext;

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

    await render(hbs`
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

    assert.dom(this.element as Element).hasText('Label Help');
  });
});
