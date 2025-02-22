import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import FormCheck from '@trusted-american/design-system/components/form/check';
import { fn } from '@ember/helper';

import type { FormCheckSignature } from '@trusted-american/design-system/components/form/check';

type Context = FormCheckSignature['Args'] & TestContext;

module('Integration | Component | form/check', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = false;

    await render<Context>(
      <template>
        <FormCheck
          @value={{this.value}}
          @label="Label"
          @identifier="identifier"
          @isInline={{false}}
          @isSwitch={{false}}
          @help="Help"
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom('label').hasText('Label');
    assert.dom('[data-test-form-help]').exists();

    await click('input');

    assert.true(this.value);
  });
});
