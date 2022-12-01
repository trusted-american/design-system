import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, fillIn, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormDateInputComponentSignature } from '@trusted-american/design-system/components/form/date-input';

type Context = FormDateInputComponentSignature['Args'] & TestContext;

module('Integration | Component | form/date-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    assert.expect(4);

    this.value = new Date();
    this.min = undefined;
    this.max = undefined;
    this.label = 'Label';
    this.required = true;
    this.identifier = 'identifier';
    this.onChange = (value) => {
      const date = new Date(2014, 8, 13);
      assert.strictEqual(value?.getTime(), date.getTime());
    };

    await render(hbs`
      <Form::DateInput
        @value={{this.value}}
        @min={{this.min}}
        @max={{this.max}}
        @label={{this.label}}
        @required={{this.required}}
        @identifier={{this.identifier}}
        @onChange={{this.onChange}}
      />
    `);

    assert.dom(this.element as Element).hasText('Label *');
    assert.dom('input').hasAttribute('type', 'date');
    assert.dom('input').hasAttribute('id', this.identifier);

    await fillIn('input', '2014-09-13');
  });
});
