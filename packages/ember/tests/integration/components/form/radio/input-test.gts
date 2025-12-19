import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormRadioInput from '@trusted-american/ember/components/form/radio/input';

module('Integration | Component | form/radio/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <FormRadioInput
          @checked={{true}}
          @name="name"
          @identifier="identifier"
          @isRequired={{true}}
        />
      </template>,
    );

    assert.dom().hasText('');
  });
});
