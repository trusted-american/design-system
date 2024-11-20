import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { ListFilterSignature } from '@trusted-american/design-system/components/list-filter';

type Context = ListFilterSignature<unknown>['Args'] & TestContext;

module('Integration | Component | list-filter', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    // assert.expect(3 + 5);

    this.predicates = [
      {
        type: 'single',
        label: 'Status',
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
        label: 'Archived',
        key: 'isArchived',
        value: undefined,
        options: [
          { value: true, label: 'True' },
          { value: false, label: 'False' },
        ],
      },
      {
        type: 'multi',
        label: 'State',
        key: 'state',
        value: [],
        options: [
          { value: 'az', label: 'AZ' },
          { value: 'ca', label: 'CA' },
        ],
      },
      {
        type: 'string',
        label: 'City',
        key: 'city',
        value: undefined,
      },
      {
        type: 'date',
        label: 'Created Date',
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
        @text='Filter'
        @clearText='Clear'
        @doneText='Done'
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('[data-test-list-filter]').hasText('Filter');

    assert.dom('[data-test-predicate-toggle]').exists({ count: 5 });

    await click('[data-test-predicate-toggle] input');

    assert.dom('[data-test-predicate-value]').exists({ count: 1 });

    await click('[data-test-list-filter]');

    assert
      .dom('[data-test-list-filter-dropdown]')
      .hasAttribute('data-popper-placement');

    await click('[data-test-done]');

    assert
      .dom('[data-test-list-filter-dropdown]')
      .hasNoAttribute('data-popper-placement');
  });
});
