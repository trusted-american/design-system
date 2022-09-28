import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

// interface Context extends TestContext {
//   value: boolean;
//   label: string;
//   identifier: string;
//   inline?: boolean;
//   switch?: boolean;
//   help?: string;
//   helpTooltip?: string;
// }

module('Integration | Component | form/check', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
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

    assert.dom(this.element).hasText('Label Help');
  });
});
