import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { FormCheckInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';

import type { FormCheckInputSignature } from '@trusted-american/design-system/components/form/check/input';

type Context = FormCheckInputSignature['Args'] & TestContext;

module('Integration | Component | form/check/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = false;

    await render<Context>(
      <template>
        <FormCheckInput
          @value={{this.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom().hasText('');
  });
});
