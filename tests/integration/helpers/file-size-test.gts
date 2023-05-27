import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import fileSize from '@trusted-american/design-system/helpers/file-size';
import { tracked } from 'tracked-built-ins';

module('Integration | Helper | file-size', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked({
      inputValue: 1234,
    });

    await render(<template>{{fileSize state.inputValue}}</template>);

    assert.dom().hasText('1.21 KB');
  });
});
