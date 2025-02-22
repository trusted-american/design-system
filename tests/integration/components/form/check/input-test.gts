import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormCheckInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | form/check/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked({ value: false });

    await render(
      <template>
        <FormCheckInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom().hasText('');
  });
});
