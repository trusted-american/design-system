import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, fillIn, type TestContext } from '@ember/test-helpers';
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

    //Single Multiple
    await click('[data-test-predicate-toggle]:nth-of-type(1)');
    assert.dom('[data-test-predicate-value]').exists({ count: 1 });
    assert.dom('li:nth-of-type(2) select').hasValue('0');

    //Single Binary
    await click('[data-test-predicate-toggle]:nth-of-type(2)');
    assert.dom('[data-test-predicate-value]').exists({ count: 2 });
    assert.dom('li:nth-of-type(3) select').hasValue('0');

    //Multi
    await click('[data-test-predicate-toggle]:nth-of-type(3)');
    assert.dom('[data-test-predicate-value]').exists({ count: 3 });
    assert.dom('li:nth-of-type(4) div:nth-of-type(1) input').exists();
    assert.dom('li:nth-of-type(4) div:nth-of-type(2) input').exists();
    assert.dom('li:nth-of-type(4) div:nth-of-type(3) input').doesNotExist();

    //String
    await click('[data-test-predicate-toggle]:nth-of-type(4)');
    assert.dom('[data-test-predicate-value]').exists({ count: 4 });
    assert.dom('li:nth-of-type(5) input').hasValue('Text');
    await fillIn('li:nth-of-type(5) input', 'String');
    assert.dom('li:nth-of-type(5) input').hasValue('String');

    //Date
    await click('[data-test-predicate-toggle]:nth-of-type(5)');
    assert.dom('[data-test-predicate-value]').exists({ count: 5 });
    assert.dom('li:nth-of-type(6) div input:nth-of-type(1)').exists();
    assert.dom('li:nth-of-type(6) div div:nth-of-type(1)').hasText('and');
    assert.dom('li:nth-of-type(6) div input:nth-of-type(2)').exists();
  });
});
