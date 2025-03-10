import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { FormRadio } from '@trusted-american/design-system';
import { tracked } from 'tracked-built-ins';
import { fn } from '@ember/helper';

module('Integration | Component | form/radio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const options = [
      { value: 'one', label: 'One' },
      { value: 'two', label: 'Two' },
    ];
    const state = tracked<{ selected: string | undefined }>({
      selected: undefined,
    });

    await render(
      <template>
        <FormRadio
          @options={{options}}
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
