import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { htmlSafe } from '@trusted-american/design-system';

module('Integration | Helper | html-safe', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        {{htmlSafe "<div>1234</div>"}}
      </template>,
    );

    assert.dom().hasText('1234');
  });
});
