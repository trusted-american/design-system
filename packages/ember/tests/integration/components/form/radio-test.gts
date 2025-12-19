import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import FormRadio from '@trusted-american/ember/components/form/radio';
import { tracked } from '@glimmer/tracking';
import { array, fn, hash } from '@ember/helper';

module('Integration | Component | form/radio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked selected?: string;
    }
    const state = new State();

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
