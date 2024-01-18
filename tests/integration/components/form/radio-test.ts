import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormRadioSignature } from '@trusted-american/design-system/components/form/radio';

type Context = FormRadioSignature<unknown>['Args'] & TestContext;

module('Integration | Component | form/radio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    // assert.expect(3);

    this.options = [
      { value: 'one', label: 'One' },
      { value: 'two', label: 'Two' },
    ];
    this.selected = undefined;
    this.label = 'Label';
    this.identifier = 'identifier';
    this.required = undefined;
    this.inline = undefined;
    this.onChange = (selected) => {
      this.selected = selected;
      assert.ok(selected);
    };

    await render<Context>(hbs`
      <Form::Radio
        @options={{this.options}}
        @selected={{this.selected}}
        @label={{this.label}}
        @identifier={{this.identifier}}
        @required={{this.required}}
        @inline={{this.inline}}
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('label').hasText('Label');
    assert.dom('.form-check').hasText('One');
    assert.dom('.form-check:last-child').hasText('Two');
  });
});
