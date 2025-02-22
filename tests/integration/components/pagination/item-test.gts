import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import PaginationItem from '@trusted-american/design-system/components/pagination/item';
import { noop } from '@nullvoxpopuli/ember-composable-helpers';

module('Integration | Component | pagination/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <PaginationItem @index={{0}} @page={{0}} @onClick={{(noop)}} />
      </template>,
    );

    assert.dom().hasText('1');
  });
});
