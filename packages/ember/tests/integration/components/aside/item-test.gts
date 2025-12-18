import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { AsideItem } from '@trusted-american/ember';
import { faBoxesStacked } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | aside/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <AsideItem @route="index" @label="Label" @icon={{faBoxesStacked}} />
      </template>,
    );

    assert.dom().hasText('Label');
  });
});
