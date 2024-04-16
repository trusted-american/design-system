import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormTimeInputSignature } from '@trusted-american/design-system/components/form/time-input';

type Context = FormTimeInputSignature['Args'] & TestContext;

module('Integration | Component | form/time-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<Context>(hbs`
      <Form::TimeInput
        @value={{null}}
        @label='Label'
        @identifier='identifier'
        @required={{true}}
        @help='Help'
        @invalidFeedback='Invalid feedback'
        @onChange={{fn (mut this.value)}}
      />
    `);

    assert.dom('[data-test-form-label]').exists();
    assert.dom('input').exists();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();
  });
});
