import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormHtmlInputSignature } from '@trusted-american/design-system/components/form/html-input';

type Context = FormHtmlInputSignature['Args'] & TestContext;

module('Integration | Component | form/html-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.onChange = () => {};

    await render<Context>(
      <template>
        <Form::HtmlInput
          @value="value"
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @editorLabel="Editor"
          @codeLabel="Code"
          @onChange={{this.onChange}}
        />
      </template>,
    );

    assert.dom().includesText('Label Required');

    assert.dom('[data-test-value-editor]').exists();
    assert.dom('[data-test-form-textarea]').doesNotExist();

    await click('[data-test-code]');

    assert.dom('[data-test-value-editor]').doesNotExist();
    assert.dom('[data-test-form-textarea]').exists();
  });
});
