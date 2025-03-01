import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, fillIn, select } from '@ember/test-helpers';
import { selectChoose } from 'ember-power-select/test-support';
import dayjs from 'dayjs';
import { ListFilter } from '@trusted-american/design-system';
import { tracked } from 'tracked-built-ins';

import type {
  DateRangeQueryParam,
  Predicate,
} from '@trusted-american/design-system/components/list-filter';

interface Props {
  status?: string;
  isArchived?: boolean;
  state: string[];
  city?: string;
  createdAt: DateRangeQueryParam;
}

module('Integration | Component | list-filter', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<Props>({
      status: undefined,
      isArchived: undefined,
      state: [],
      city: undefined,
      createdAt: [],
    });

    const predicates: Predicate[] = [
      {
        type: 'single',
        label: 'Status',
        key: 'status',
        value: state.status,
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
        value: state.isArchived,
        options: [
          { value: true, label: 'True' },
          { value: false, label: 'False' },
        ],
      },
      {
        type: 'multi',
        label: 'State',
        key: 'state',
        value: state.state,
        options: [
          { value: 'az', label: 'AZ' },
          { value: 'ca', label: 'CA' },
        ],
      },
      {
        type: 'string',
        label: 'City',
        key: 'city',
        value: state.city,
      },
      {
        type: 'date',
        label: 'Created date',
        key: 'createdAt',
        value: state.createdAt,
      },
    ];

    const onChange = (key: string, value: unknown) => {
      state[key as keyof Props] = value as never;
    };

    await render(
      <template>
        <ListFilter
          @predicates={{predicates}}
          @label="Filter"
          @clearLabel="Clear"
          @doneLabel="Done"
          @modeLabel="Mode"
          @inTheLastLabel="is in the last"
          @equalsLabel="is equal to"
          @betweenLabel="is between"
          @isAfterLabel="is after"
          @isAfterOrOnLabel="is on or after"
          @isBeforeLabel="is before"
          @isBeforeOrOnLabel="is before or on"
          @valueLabel="Value"
          @valueALabel="Value A"
          @valueBLabel="Value B"
          @andLabel="and"
          @daysLabel="Days"
          @monthsLabel="Months"
          @requiredLabel="Required"
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{onChange}}
        />
      </template>,
    );

    assert.dom('[data-test-list-filter]').hasText('Filter');
    assert.dom('[data-test-predicate-toggle]').exists({ count: 5 });

    // single
    await click('[data-test-predicate-toggle]:nth-of-type(1)');
    await selectChoose(
      '[data-test-predicate-value]:nth-of-type(2) [data-test-form-power-select]',
      '.ember-power-select-option',
      1,
    );

    // single
    await click('[data-test-predicate-toggle]:nth-of-type(2)');
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
      '[data-test-predicate-value]:nth-of-type(4) [data-test-form-check]:nth-of-type(1) input',
    );
    await click(
      '[data-test-predicate-value]:nth-of-type(4) [data-test-form-check]:nth-of-type(2) input',
    );

    // string
    await click('[data-test-predicate-toggle]:nth-of-type(4)');
    await fillIn(
      '[data-test-predicate-value]:nth-of-type(5) [data-test-form-input]',
      'Test',
    );

    // date
    await click('[data-test-predicate-toggle]:nth-of-type(5)');
    await select('[data-test-mode]', '1');
    await fillIn('#valueA4', '2020-01-01');

    await click('[data-test-done]');

    assert.strictEqual(state.status, 'two');
    assert.false(state.isArchived);
    assert.deepEqual(state.state, ['az', 'ca']);
    assert.strictEqual(state.city, 'Test');
    assert.strictEqual(Object.keys(state.createdAt).length, 4);

    await click('[data-test-clear]');

    assert.strictEqual(state.status, undefined);
    assert.strictEqual(state.isArchived, undefined);
    assert.deepEqual(state.state, []);
    assert.strictEqual(state.city, undefined);
    assert.deepEqual(state.createdAt, []);
  });

  test('it works with date predicates', async function (assert) {
    const state = tracked<Props>({
      status: undefined,
      isArchived: undefined,
      state: [],
      city: undefined,
      createdAt: [],
    });

    const predicates: Predicate[] = [
      {
        type: 'date',
        label: 'Created date',
        key: 'createdAt',
        value: state.createdAt,
      },
    ];

    const onChange = (key: string, value: unknown) => {
      state[key as keyof Props] = value as never;
    };

    await render(
      <template>
        <ListFilter
          @predicates={{predicates}}
          @label="Filter"
          @clearLabel="Clear"
          @doneLabel="Done"
          @modeLabel="Mode"
          @inTheLastLabel="is in the last"
          @equalsLabel="is equal to"
          @betweenLabel="is between"
          @isAfterLabel="is after"
          @isAfterOrOnLabel="is on or after"
          @isBeforeLabel="is before"
          @isBeforeOrOnLabel="is before or on"
          @valueLabel="Value"
          @valueALabel="Value A"
          @valueBLabel="Value B"
          @andLabel="and"
          @daysLabel="Days"
          @monthsLabel="Months"
          @requiredLabel="Required"
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{onChange}}
        />
      </template>,
    );

    const today = new Date();
    const yesterday = new Date();
    yesterday.setDate(today.getDate() - 1);
    await click('[data-test-predicate-toggle]');

    /*
     * Is in the Last
     */
    await select('[data-test-mode]', '0');
    await fillIn('#valueA0', '1');
    await select('#valueB0', '2');
    await click('[data-test-done]');
    if (Array.isArray(state.createdAt)) {
      throw new Error();
    }
    assert.strictEqual(state.createdAt.gt, null);
    assert.strictEqual(state.createdAt.lt, null);
    assert.strictEqual(
      dayjs(state.createdAt.lte).endOf('day').toDate().toISOString(),
      dayjs(today).endOf('day').toDate().toISOString(),
    );
    assert.strictEqual(
      dayjs(state.createdAt.gte).startOf('day').toDate().toISOString(),
      dayjs(yesterday).startOf('day').toDate().toISOString(),
    );

    /*
     * Is Equal To
     */
    await select('[data-test-mode]', '1');
    await fillIn('#valueA0', '2025-01-01');
    await click('[data-test-done]');
    if (Array.isArray(state.createdAt)) {
      throw new Error();
    }
    assert.strictEqual(state.createdAt.lt, null);
    assert.strictEqual(state.createdAt.gt, null);
    assert.strictEqual(
      dayjs(state.createdAt.lte).startOf('day').toDate().toISOString(),
      dayjs(new Date(2025, 0, 1))
        .startOf('day')
        .toDate()
        .toISOString(),
    );
    assert.strictEqual(
      dayjs(state.createdAt.gte).endOf('day').toDate().toISOString(),
      dayjs(new Date(2025, 0, 1))
        .endOf('day')
        .toDate()
        .toISOString(),
    );

    /*
     * Is Between
     */
    await select('[data-test-mode]', '2');
    await fillIn('#valueA0', '2025-01-01');
    await fillIn('#valueB0', '2025-01-02');
    await click('[data-test-done]');

    if (Array.isArray(state.createdAt)) {
      throw new Error();
    }

    assert.strictEqual(state.createdAt.lt, null);
    assert.strictEqual(state.createdAt.gt, null);
    assert.strictEqual(
      state.createdAt.lte?.toISOString(),
      dayjs(new Date(2025, 0, 2))
        .endOf('day')
        .toDate()
        .toISOString(),
    );
    assert.strictEqual(
      state.createdAt.gte?.toISOString(),
      new Date(2025, 0, 1).toISOString(),
    );

    /*
     * Is After
     */
    await select('[data-test-mode]', '3');
    await fillIn('#valueA0', '2025-01-01');
    await click('[data-test-done]');

    if (Array.isArray(state.createdAt)) {
      throw new Error();
    }
    assert.strictEqual(state.createdAt.lt, null);
    assert.strictEqual(
      state.createdAt.gt?.toISOString(),
      new Date(2025, 0, 1).toISOString(),
    );
    assert.strictEqual(state.createdAt.lte, null);
    assert.strictEqual(state.createdAt.gte, null);

    /*
     * Is On Or After
     */
    await select('[data-test-mode]', '4');
    await fillIn('#valueA0', '2025-01-01');
    await click('[data-test-done]');

    if (Array.isArray(state.createdAt)) {
      throw new Error();
    }
    assert.strictEqual(state.createdAt.lt, null);
    assert.strictEqual(state.createdAt.gt, null);
    assert.strictEqual(state.createdAt.lte, null);
    assert.strictEqual(
      state.createdAt.gte?.toISOString(),
      new Date(2025, 0, 1).toISOString(),
    );

    /*
     * Is Before
     */
    await select('[data-test-mode]', '5');
    await fillIn('#valueA0', '2025-01-01');
    await click('[data-test-done]');

    if (Array.isArray(state.createdAt)) {
      throw new Error();
    }
    assert.strictEqual(
      state.createdAt.lt?.toISOString(),
      new Date(2025, 0, 1).toISOString(),
    );
    assert.strictEqual(state.createdAt.gt, null);
    assert.strictEqual(state.createdAt.lte, null);
    assert.strictEqual(state.createdAt.gte, null);

    /*
     * Is On orBefore
     */
    await select('[data-test-mode]', '6');
    await fillIn('#valueA0', '2025-01-01');
    await click('[data-test-done]');

    if (Array.isArray(state.createdAt)) {
      throw new Error();
    }
    assert.strictEqual(state.createdAt.lt, null);
    assert.strictEqual(state.createdAt.gt, null);
    assert.strictEqual(
      state.createdAt.lte?.toISOString(),
      new Date(2025, 0, 1).toISOString(),
    );
    assert.strictEqual(state.createdAt.gte, null);
  });
});
