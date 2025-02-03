import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import {
  render,
  click,
  fillIn,
  select,
  type TestContext,
} from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';
import { selectChoose } from 'ember-power-select/test-support';
import dayjs from 'dayjs';

import type {
  ListFilterSignature,
  DateRangeQueryParam,
} from '@trusted-american/design-system/components/list-filter';

interface Props {
  status?: string;
  isArchived?: boolean;
  state: string[];
  city?: string;
  createdAt: DateRangeQueryParam;
}

type Context = ListFilterSignature<unknown>['Args'] & TestContext & Props;

module('Integration | Component | list-filter', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.status = undefined;
    this.isArchived = undefined;
    this.state = [];
    this.city = undefined;
    this.createdAt = [];

    this.predicates = [
      {
        type: 'single',
        label: 'Status',
        key: 'status',
        value: this.status,
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
        value: this.isArchived,
        options: [
          { value: true, label: 'True' },
          { value: false, label: 'False' },
        ],
      },
      {
        type: 'multi',
        label: 'State',
        key: 'state',
        value: this.state,
        options: [
          { value: 'az', label: 'AZ' },
          { value: 'ca', label: 'CA' },
        ],
      },
      {
        type: 'string',
        label: 'City',
        key: 'city',
        value: this.city,
      },
      {
        type: 'date',
        label: 'Created date',
        key: 'createdAt',
        value: this.createdAt,
      },
    ];

    this.onChange = (key: string, value: unknown) => {
      // @ts-expect-error keyof this doesn't work here
      this[key] = value;
    };

    await render<Context>(hbs`
      <ListFilter
        @predicates={{this.predicates}}
        @text="Filter"
        @clearText="Clear"
        @doneText="Done"
        @modeText="Mode"
        @inTheLastText="is in the last"
        @equalsText="is equal to"
        @betweenText="is between"
        @isAfterText="is after"
        @isAfterOrOnText="is on or after"
        @isBeforeText="is before"
        @isBeforeOrOnText="is before or on"
        @valueText="Value"
        @valueAText="Value A"
        @valueBText="Value B"
        @andText="and"
        @daysText="Days"
        @monthsText="Months"
        @chooseText="Choose…"
        @searchText="Search…"
        @onChange={{this.onChange}}
      />
    `);

    assert.dom('[data-test-list-filter]').hasText('Filter');
    assert.dom('[data-test-predicate-toggle]').exists({ count: 5 });

    // single
    await click('[data-test-predicate-toggle]:nth-of-type(1)');
    assert
      .dom(
        '[data-test-predicate-value]:nth-of-type(2) [data-test-form-power-select]',
      )
      .exists();
    await selectChoose(
      '[data-test-predicate-value]:nth-of-type(2) [data-test-form-power-select]',
      '.ember-power-select-option',
      1,
    );

    // single
    await click('[data-test-predicate-toggle]:nth-of-type(2)');
    assert
      .dom(
        '[data-test-predicate-value]:nth-of-type(3) [data-test-form-power-select]',
      )
      .exists();
    await selectChoose(
      '[data-test-predicate-value]:nth-of-type(3) [data-test-form-power-select]',
      '.ember-power-select-option',
      1,
    );

    // multi
    await click('[data-test-predicate-toggle]:nth-of-type(3)');
    assert
      .dom('[data-test-predicate-value]:nth-of-type(4) [data-test-form-check]')
      .exists({ count: 2 });
    await click(
      '[data-test-predicate-value]:nth-of-type(4) [data-test-form-check]:nth-of-type(2) input',
    );

    // string
    await click('[data-test-predicate-toggle]:nth-of-type(4)');
    assert
      .dom('[data-test-predicate-value]:nth-of-type(5) [data-test-form-input]')
      .exists();
    await fillIn(
      '[data-test-predicate-value]:nth-of-type(5) [data-test-form-input]',
      'Test',
    );

    // date
    await click('[data-test-predicate-toggle]:nth-of-type(5)');
    assert
      .dom('[data-test-predicate-value]:nth-of-type(6) [data-test-form-select]')
      .exists();
    assert
      .dom(
        '[data-test-predicate-value]:nth-of-type(6) div input:nth-of-type(1)',
      )
      .exists();
    assert
      .dom('[data-test-predicate-value]:nth-of-type(6) div div:nth-of-type(1)')
      .hasText('and');
    assert
      .dom(
        '[data-test-predicate-value]:nth-of-type(6) div input:nth-of-type(2)',
      )
      .exists();

    await click('[data-test-done]');

    assert.strictEqual(this.status, 'two');
    assert.false(this.isArchived);
    assert.deepEqual(this.state, ['az', 'ca']);
    assert.strictEqual(this.city, 'Test');
    assert.strictEqual(Object.keys(this.createdAt).length, 4);

    await click('[data-test-clear]');

    assert.strictEqual(this.status, undefined);
    assert.strictEqual(this.isArchived, undefined);
    assert.deepEqual(this.state, []);
    assert.strictEqual(this.city, undefined);
    assert.deepEqual(this.createdAt, []);
  });

  test('it works with date predicates', async function (this: Context, assert) {
    this.predicates = [
      {
        type: 'date',
        label: 'Created date',
        key: 'createdAt',
        value: [],
      },
    ];

    this.onChange = (key: string, value: unknown) => {
      // @ts-expect-error keyof this doesn't work here
      this[key] = value;
    };

    await render<Context>(hbs`
      <ListFilter
        @predicates={{this.predicates}}
        @text="Filter"
        @clearText="Clear"
        @doneText="Done"
        @modeText="Mode"
        @inTheLastText="is in the last"
        @equalsText="is equal to"
        @betweenText="is between"
        @isAfterText="is after"
        @isAfterOrOnText="is on or after"
        @isBeforeText="is before"
        @isBeforeOrOnText="is before or on"
        @valueText="Value"
        @valueAText="Value A"
        @valueBText="Value B"
        @andText="and"
        @daysText="Days"
        @monthsText="Months"
        @chooseText="Choose…"
        @searchText="Search…"
        @onChange={{this.onChange}}
      />
    `);

    await click('[data-test-predicate-toggle]');
    await select('[data-test-form-select]', '2');
    await fillIn('#valueA0', '2025-01-01');
    await fillIn('#valueB0', '2025-01-02');
    await click('[data-test-done]');

    if (Array.isArray(this.createdAt)) {
      throw new Error();
    }

    assert.strictEqual(
      this.createdAt.gte?.toISOString(),
      new Date(2025, 0, 1).toISOString(),
    );
    assert.strictEqual(this.createdAt.gt, null);
    assert.strictEqual(this.createdAt.lt, null);
    assert.strictEqual(
      this.createdAt.lte?.toISOString(),
      dayjs(new Date(2025, 0, 2))
        .endOf('day')
        .toDate()
        .toISOString(),
    );
  });
});
