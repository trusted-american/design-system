import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';
import type { Option } from '@trusted-american/design-system/components/form/select';

// type Context = ListSortSignature<unknown>['Args'] & TestContext;
interface Context<T> extends TestContext {
  sortBy: keyof UserModel;
  sortAscending: boolean;
  options: Option<T>[];
  onChange: (sortBy: keyof UserModel, sortAscending: boolean) => void;
}

interface UserModel {
  createdAt: Date;
  modifiedAt: Date;
}

module('Integration | Component | list-sort', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context<string>, assert) {
    this.sortBy = 'createdAt';
    this.sortAscending = false;
    this.options = [
      { label: 'Created Date', value: 'createdAt' },
      { label: 'Modified Date', value: 'modifiedAt' },
    ];
    this.onChange = (sortBy: keyof UserModel, sortAscending: boolean) => {
      assert.strictEqual(sortBy, 'createdAt');
      assert.true(sortAscending);
    };

    await render<Context<'createdAt' | 'modifiedAt'>>(hbs`
      <ListSort
          @sortBy={{this.sortBy}}
          @sortAscending={{this.sortAscending}}
          @options={{this.options}}
          @onChange={{this.onChange}}
        />
    `);

    await this.pauseTest();

    assert
      .dom()
      .hasText('Sort Created Date Modified Date High to Low Low to High');
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
