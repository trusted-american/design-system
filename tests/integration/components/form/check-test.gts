import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { FormCheck } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | form/check', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked({ value: false });

    await render(
      <template>
        <FormCheck
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @isInline={{false}}
          @isSwitch={{false}}
          @help="Help"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('label').hasText('Label');
    assert.dom('[data-test-form-help]').exists();

    await click('input');

    assert.true(state.value);
  });
});
