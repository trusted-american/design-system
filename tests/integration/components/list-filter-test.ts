import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { ListFilterComponentSignature } from '@trusted-american/design-system/components/list-filter';

type Context = ListFilterComponentSignature<unknown>['Args'] & TestContext;

module('Integration | Component | list-filter', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    assert.expect(3 + 5);

    this.predicates = [
      {
        type: 'single',
        name: 'Status',
        key: 'status',
        value: undefined,
        options: [
          { value: 'one', label: 'One' },
          { value: 'two', label: 'Two' },
          { value: 'three', label: 'Three' },
        ],
      },
      {
        type: 'single',
        name: 'Archived',
        key: 'isArchived',
        value: undefined,
        options: [
          { value: true, label: 'True' },
          { value: false, label: 'False' },
        ],
      },
      {
        type: 'multi',
        name: 'State',
        key: 'state',
        value: [],
        options: [
          { value: 'az', label: 'AZ' },
          { value: 'ca', label: 'CA' },
        ],
      },
      {
        type: 'string',
        name: 'City',
        key: 'city',
        value: undefined,
      },
      {
        type: 'date',
        name: 'Created Date',
        key: 'createdAt',
        value: [],
      },
    ];
    this.onChange = () => {
      assert.true(true);
    };

    await render<Context>(hbs`
      <ListFilter
        @predicates={{this.predicates}}
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('[data-test-list-filter]').hasText('Filter');
    assert.dom('[data-test-predicate-toggle]').exists({ count: 5 });

    await click('[data-test-predicate-toggle] input');

    assert.dom('[data-test-predicate-value]').exists({ count: 1 });

    await click('[data-test-done]');
  });
});
