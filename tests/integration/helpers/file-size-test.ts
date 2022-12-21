import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

interface Context extends TestContext {
  element: Element;

  inputValue: number;
}

module('Integration | Helper | file-size', function (hooks) {
  setupRenderingTest(hooks);

  // TODO: Replace this with your real tests.
  test('it renders', async function (this: Context, assert) {
    this.inputValue = 1234;

    await render(hbs`{{file-size this.inputValue}}`);

    assert.dom(this.element).hasText('1.21 KB');
  });
});
