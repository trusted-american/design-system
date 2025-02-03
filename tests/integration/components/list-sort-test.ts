import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { Option } from '@trusted-american/design-system/components/form/select';

module('Integration | Component | list-sort', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.expect(5);

    const sortBy: keyof UserModel = 'createdAt';
    const sortAscending = false;
    const options: Option<keyof UserModel>[] = [
      { label: 'Created Date', value: 'createdAt' },
    ];
    const onChange = (sortBy: keyof UserModel, sortAscending: boolean) => {
      assert.strictEqual(sortBy, 'createdAt');
      assert.true(sortAscending);
    };

    await render(hbs`
      <ListSort
        @sortBy={{sortBy}}
        @sortAscending={{sortAscending}}
        @options={{options}}
        @onChange={{onChange}}
      />
    `);

    assert.dom().hasText('Sort Created Date High to Low Low to High');
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
