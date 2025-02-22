import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { AsideItem } from '@trusted-american/design-system';

module('Integration | Component | aside/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <AsideItem @label="Label" @icon="boxes-stacked" @route="index" />
      </template>,
    );

    assert.dom().hasText('Label');
  });
});
