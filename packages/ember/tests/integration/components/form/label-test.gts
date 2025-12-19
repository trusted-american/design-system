import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormLabel from '@trusted-american/ember/components/form/label';

module('Integration | Component | form/label', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <FormLabel
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @requiredLabel="Required"
        />
      </template>,
    );

    assert.dom('label').exists();
    assert.dom('label').hasText('Label Required');
  });
});
