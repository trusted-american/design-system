import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormCheckInputSignature } from '@trusted-american/design-system/components/form/check/input';

type Context = FormCheckInputSignature['Args'] & TestContext;

module('Integration | Component | form/check/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = false;

    await render<Context>(hbs`
      <Form::Check::Input
        @value={{this.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @onChange={{fn (mut this.value)}}
      />
    `);

    assert.dom().hasText('');
  });
});
