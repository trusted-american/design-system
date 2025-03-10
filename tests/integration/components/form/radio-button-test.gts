import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { FormRadioButton } from '@trusted-american/design-system';
import { tracked } from 'tracked-built-ins';
import { array, fn, hash } from '@ember/helper';

module('Integration | Component | form/radio-button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{ selected: string | undefined }>({
      selected: undefined,
    });

    await render(
      <template>
        <FormRadioButton
          @options={{array
            (hash value="one" label="One" color="success")
            (hash value="two" label="Two")
          }}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @size="sm"
          @onChange={{fn (mut state.selected)}}
        />
      </template>,
    );

    assert.dom('div').hasText('One Two');

    await click('#identifier1');

    assert.strictEqual(state.selected, 'two');
  });
});
