import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext, fillIn } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormMarkdownInputSignature } from '@trusted-american/design-system/components/form/markdown-input';

type Context = FormMarkdownInputSignature['Args'] & TestContext;

module('Integration | Component | form/markdown-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render<Context>(hbs`
      <Form::MarkdownInput
        @value={{this.value}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="Help"
        @invalidFeedback="Invalid feedback"
        @onChange={{fn (mut this.value)}}
      />
    `);

    await click('[data-test-button]');

    await fillIn('[data-test-form-textarea]', 'test');

    assert.strictEqual(this.value, 'test');
  });
});
