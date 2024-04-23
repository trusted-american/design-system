import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';
import type { FormInputSignature } from '@trusted-american/design-system/components/form/input';
type Context = FormInputSignature['Args'] & TestContext;

module('Integration | Component | form/html-input', function (hooks) {
  // eslint-disable-next-line @typescript-eslint/no-unsafe-call
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = 'value';

    await render<Context>(hbs`
    <Form::HtmlInput
      @value={{this.value}}
      @label="Label"
      @identifier="textarea"
      @required={{true}}
      @inputOnly={{false}}
      @help="Help"
      @onChange={{fn (mut this.value)}}
      placeholder="Placeholder"
    />
  `);

    assert.dom().includesText('Label *');
    assert.dom().includesText('Please provide a value.');

    assert.dom('[data-test-value-editor]').exists();
    assert.dom('[data-test-value-code]').doesNotExist();

    await click('[data-test-code]');

    assert.dom('[data-test-value-editor]').doesNotExist();
    assert.dom('[data-test-value-code]').exists();
  });
});
