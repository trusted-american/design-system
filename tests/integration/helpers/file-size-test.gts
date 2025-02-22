import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { fileSize } from '@trusted-american/design-system';

module('Integration | Helper | file-size', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template>{{fileSize 1234}}</template>);

    assert.dom().hasText('1.21 KB');
  });
});
