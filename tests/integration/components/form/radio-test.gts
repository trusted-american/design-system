import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { FormRadio } from '@trusted-american/design-system';
import { tracked } from 'tracked-built-ins';
import { array, fn, hash } from '@ember/helper';

module('Integration | Component | form/radio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{ selected: string | undefined }>({
      selected: undefined,
    });

    await render(
      <template>
        <FormRadio
          @options={{array
            (hash value="one" label="One")
            (hash value="two" label="Two")
          }}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{undefined}}
          @requiredLabel="Required"
          @isInline={{undefined}}
          @onChange={{fn (mut state.selected)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('.form-check').hasText('One');
    assert.dom('.form-check:last-child').hasText('Two');

    await click('#identifier1');

    assert.strictEqual(state.selected, 'two');
  });
});
