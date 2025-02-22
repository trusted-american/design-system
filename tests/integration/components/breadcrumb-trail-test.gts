import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { BreadcrumbTrail } from '@trusted-american/design-system';

module('Integration | Component | breadcrumb-trail', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><BreadcrumbTrail /></template>);

    assert.dom('nav').hasText('');
  });
});
