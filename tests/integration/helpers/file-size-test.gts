import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import fileSize from '@trusted-american/design-system/helpers/file-size';

interface Context extends TestContext {
  element: Element;

  inputValue: number;
}

module('Integration | Helper | file-size', function (hooks) {
  setupRenderingTest(hooks);

  // TODO: Replace this with your real tests.
  test('it renders', async function (this: Context, assert) {
    this.inputValue = 1234;

    await render<Context>(<template>{{fileSize this.inputValue}}</template>);

    assert.dom().hasText('1.21 KB');
  });
});
