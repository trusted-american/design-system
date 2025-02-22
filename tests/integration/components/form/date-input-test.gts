import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, fillIn } from '@ember/test-helpers';
import { FormDateInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | form/date-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked({ value: new Date() as Date | null });

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
          @invalidFeedback="Invalid feedback"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').exists();
    assert.dom('[data-test-form-input]').hasAttribute('type', 'date');

    await fillIn('[data-test-form-input]', '2014-09-13');

    assert.strictEqual(
      state.value?.toISOString(),
      new Date(Date.UTC(2014, 8, 13)).toISOString(),
    );
  });
});
