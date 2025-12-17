import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { ListSort } from '@trusted-american/ember';
import { array, hash } from '@ember/helper';
import { tracked } from '@glimmer/tracking';
import type { ListAttributesKey } from '@trusted-american/ember/components/list-attributes';

module('Integration | Component | list-sort', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    interface User {
      createdAt: Date;
      name: string;
      obj: {
        prop: string;
      };
    }

    class State {
      @tracked sortBy: ListAttributesKey<User> = 'createdAt';
      @tracked sortAscending = false;
    }
    const state = new State();

    const onChange = (
      sortBy: ListAttributesKey<User>,
      sortAscending: boolean,
    ) => {
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
            (hash value="obj.prop" label="Obj prop")
          }}
          @label="Sort"
          @highToLowLabel="High to low"
          @lowToHighLabel="Low to high"
          @onChange={{onChange}}
        />
      </template>,
    );

    assert
      .dom()
      .hasText('Sort Created date Name Obj prop High to low Low to high');
    assert
      .dom(
        '[data-test-list-sort-dropdown] [data-test-dropdown-item] [data-test-icon]',
      )
      .doesNotHaveClass('invisible');
    assert
      .dom(
        '[data-test-list-sort-dropdown] [data-test-dropdown-item]:nth-child(2) [data-test-icon]',
      )
      .hasClass('invisible');

    await click('[data-test-list-sort]');
    await click(
      '[data-test-list-sort-dropdown] [data-test-dropdown-item]:nth-child(2)',
    );

    assert.strictEqual(state.sortBy, 'name');
  });
});
