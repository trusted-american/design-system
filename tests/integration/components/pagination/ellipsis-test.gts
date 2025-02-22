import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import PaginationEllipsis from '@trusted-american/design-system/components/pagination/ellipsis';

module('Integration | Component | pagination/ellipsis', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(<template><PaginationEllipsis /></template>);

    assert.dom().hasText('…');
  });
});
