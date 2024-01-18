import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormNumberInputSignature } from '@trusted-american/design-system/components/form/number-input';

type Context = FormNumberInputSignature['Args'] & TestContext;

module('Integration | Component | form/number-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<Context>(hbs`
      <Form::NumberInput
        @value={{this.value}}
        @label="Label"
        @identifier="numberInput"
        @required={{true}}
        @help="Help"
        @invalidFeedback="Invalid feedback"
        placeholder="Placeholder"
        @onChange={{fn (mut this.value)}}
      />
    `);

    assert.dom().hasText('Label * Invalid feedback Help');
  });
});
