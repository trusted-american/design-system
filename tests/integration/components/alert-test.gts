import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import Alert from '@trusted-american/design-system/components/alert';

module('Integration | Component | alert', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template>
      <Alert>
        <:title>Title here</:title>
        <:body>Body here</:body>
      </Alert>
    </template>);

    assert.dom().hasText('Title here Body here');
  });
});
