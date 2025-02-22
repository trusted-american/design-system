import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import PaginationItem from '@trusted-american/design-system/components/pagination/item';

module('Integration | Component | pagination/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const onClick = () => {};

    await render(
      <template>
        <PaginationItem @index={{0}} @page={{0}} @onClick={{onClick}} />
      </template>,
    );

    assert.dom().hasText('1');
  });
});
