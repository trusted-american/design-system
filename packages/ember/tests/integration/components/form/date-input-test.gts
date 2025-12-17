import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { fillIn, render } from '@ember/test-helpers';
import { FormDateInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | form/date-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked value: Date | null = new Date();
    }
    const state = new State();

    await render(
      <template>
        <FormDateInput
          @value={{state.value}}
          @min={{undefined}}
          @max={{undefined}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidLabel="Invalid feedback"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').hasAttribute('type', 'date');

    await fillIn('[data-test-form-input]', '2014-09-13');

    assert.strictEqual(
      state.value?.toISOString(),
      new Date(Date.UTC(2014, 8, 13)).toISOString(),
    );
  });

  test('it works with month type', async function (assert) {
    class State {
      @tracked value: Date | null = new Date();
    }
    const state = new State();

    await render(
      <template>
        <FormDateInput
          @value={{state.value}}
          @type="month"
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').hasAttribute('type', 'month');

    await fillIn('[data-test-form-input]', '2014-09');

    assert.strictEqual(
      state.value?.toISOString(),
      new Date(Date.UTC(2014, 8, 1)).toISOString(),
    );
  });
});
