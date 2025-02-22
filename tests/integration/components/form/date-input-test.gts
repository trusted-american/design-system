import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, fillIn } from '@ember/test-helpers';
import { FormDateInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';

module('Integration | Component | form/date-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    this.value = new Date();

    await render(
      <template>
        <FormDateInput
          @value={{this.value}}
          @min={{undefined}}
          @max={{undefined}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidFeedback="Invalid feedback"
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').exists();
    assert.dom('[data-test-form-input]').hasAttribute('type', 'date');

    await fillIn('[data-test-form-input]', '2014-09-13');

    assert.strictEqual(
      this.value.toISOString(),
      new Date(Date.UTC(2014, 8, 13)).toISOString(),
    );
  });
});
