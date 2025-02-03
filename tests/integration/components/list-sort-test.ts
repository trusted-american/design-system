import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { ListSortSignature } from '@trusted-american/design-system/components/list-sort';

type Context = ListSortSignature<unknown>['Args'] & TestContext;

module('Integration | Component | list-sort', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    assert.expect(5);

    this.onChange = (sortBy: unknown, sortAscending: boolean) => {
      assert.strictEqual(sortBy, 'createdAt');
      assert.true(sortAscending);
    };

    await render<Context>(hbs`
      <ListSort
        @sortBy="createdAt"
        @sortAscending={{false}}
        @options={{array (hash value="createdAt" label="Created date")}}
        @text="Sort"
        @highToLowText="High to low"
        @lowToHighText="Low to high"
        {{! @glint-expect-error }}
        @onChange={{this.onChange}}
      />
    `);

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
