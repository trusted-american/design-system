import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { AsideGroup } from '@trusted-american/design-system';
import { faBoxesStacked } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | aside/group', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <AsideGroup @label="Label" @icon={{faBoxesStacked}} @route="index">
          template block text
        </AsideGroup>
      </template>,
    );

    assert.dom().hasText('Label template block text');
  });
});
