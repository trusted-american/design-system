import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormTimeInputSignature } from '@trusted-american/design-system/components/form/time-input';

type Context = FormTimeInputSignature['Args'] & TestContext;

module('Integration | Component | form/time-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<Context>(
      <template>
        <Form::TimeInput
          @value={{null}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidFeedback="Invalid feedback"
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('input').exists();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();
  });
});
