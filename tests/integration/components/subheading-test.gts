import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import Subheading from '@trusted-american/design-system/components/subheading';

module('Integration | Component | subheading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const title = 'Title';

    await render(<template><Subheading @title={{title}} /></template>);

    assert.dom().hasText('Title');

    await render(<template>
      <Subheading @title={{title}}>
        template block text
      </Subheading>
    </template>);

    assert.dom().hasText('Title template block text');
  });
});
