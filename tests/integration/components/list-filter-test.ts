import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { ListFilterSignature } from '@trusted-american/design-system/components/list-filter';

type Context = ListFilterSignature<string>['Args'] & TestContext;

module('Integration | Component | list-filter', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    assert.expect(3);

    this.predicates = [
      {
        name: 'Created Date',
        key: 'createdAt',
        type: 'date',
        value: [],
      },
      {
        name: 'Status',
        key: 'status',
        value: undefined,
        options: [
          { value: 'one', label: 'One' },
          { value: 'two', label: 'Two' },
          { value: 'three', label: 'Three' },
        ],
      },
    ];
    this.onChange = () => {
      assert.true(true);
    };

    await render(hbs`
      <ListFilter
        @predicates={{this.predicates}}
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('[data-test-list-filter]').hasText('Filter');
    assert.dom('[data-test-predicate-toggle]').exists({ count: 2 });

    await click('[data-test-predicate-toggle] input');

    assert.dom('[data-test-predicate-value]').exists({ count: 1 });
  });
});
