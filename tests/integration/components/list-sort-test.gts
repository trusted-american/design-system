import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { ListSort } from '@trusted-american/design-system';
import { array, hash } from '@ember/helper';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | list-sort', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{
      sortBy: 'createdAt' | 'name';
      sortAscending: boolean;
    }>({ sortBy: 'createdAt', sortAscending: false });

    const onChange = (sortBy: 'createdAt' | 'name', sortAscending: boolean) => {
      state.sortBy = sortBy;
      state.sortAscending = sortAscending;
    };

    await render(
      <template>
        <ListSort
          @sortBy={{state.sortBy}}
          @sortAscending={{state.sortAscending}}
          @options={{array
            (hash value="createdAt" label="Created date")
            (hash value="name" label="Name")
          }}
          @label="Sort"
          @highToLowLabel="High to low"
          @lowToHighLabel="Low to high"
          @onChange={{onChange}}
        />
      </template>,
    );

    assert.dom().hasText('Sort Created date Name High to low Low to high');
    assert
      .dom('[data-test-list-sort-dropdown] button')
      .doesNotHaveClass('invisible-icon');
    assert
      .dom('[data-test-list-sort-dropdown] button + button')
      .hasClass('invisible-icon');

    await click('[data-test-list-sort]');
    await click('[data-test-list-sort-dropdown] button + button');

    assert.strictEqual(state.sortBy, 'name');
  });
});
