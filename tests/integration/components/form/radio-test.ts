import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormRadioComponentSignature } from '@trusted-american/design-system/components/form/radio';

type Context = FormRadioComponentSignature<unknown>['Args'] & TestContext;

module('Integration | Component | form/radio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    assert.expect(1);

    this.options = [
      { value: 'one', label: 'One' },
      { value: 'two', label: 'Two' },
    ];
    this.selected = undefined;
    this.label = 'Label';
    this.identifier = 'identifier';
    this.required = undefined;
    this.inline = undefined;
    this.onChange = (value) => {
      assert.ok(value);
    };

    await render(hbs`
      <Form::Radio
        @options={{this.options}}
        @selected={{this.selected}}
        @label={{this.label}}
        @identifier={{this.identifier}}
        @required={{this.required}}
        @inline={{this.inline}}
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom(this.element as Element).hasText('Label One Two');
  });
});
