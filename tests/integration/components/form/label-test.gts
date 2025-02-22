import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/label', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Form::Label
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
        />
      </template>,
    );

    assert.dom('label').exists();
    assert.dom('label').hasText('Label Required');
  });
});
