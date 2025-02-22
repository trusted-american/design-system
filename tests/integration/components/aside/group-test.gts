import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { AsideGroup } from '@trusted-american/design-system';

module('Integration | Component | aside/group', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <AsideGroup @label="Label" @icon="boxes-stacked" @route="index">
          template block text
        </AsideGroup>
      </template>,
    );

    assert.dom().hasText('Label template block text');
  });
});
