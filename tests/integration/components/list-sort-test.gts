import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { ListSort } from '@trusted-american/design-system';
import { array, hash } from '@ember/helper';

module('Integration | Component | list-sort', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.expect(5);

    const onChange = (sortBy: unknown, sortAscending: boolean) => {
      assert.strictEqual(sortBy, 'createdAt');
      assert.true(sortAscending);
    };

    await render(
      <template>
        <ListSort
          @sortBy="createdAt"
          @sortAscending={{false}}
          @options={{array (hash value="createdAt" label="Created date")}}
          @label="Sort"
          @highToLowLabel="High to low"
          @lowToHighLabel="Low to high"
          @onChange={{onChange}}
        />
      </template>,
    );

    assert.dom().hasText('Sort Created date High to low Low to high');
    assert
      .dom('[data-test-list-sort-dropdown] button')
      .doesNotHaveClass('invisible-icon');
    assert
      .dom('[data-test-list-sort-dropdown] button + button')
      .hasClass('invisible-icon');

    await click('[data-test-list-sort]');
    await click('[data-test-list-sort-dropdown] button + button');
  });
});
