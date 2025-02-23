import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { Table } from '@trusted-american/design-system';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | table', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const data = [
      { firstName: 'A', lastName: 'a', email: 'a@example.com' },
      { firstName: 'B', lastName: 'b', email: 'b@example.com' },
      { firstName: 'C', lastName: 'c', email: 'c@example.com' },
      { firstName: 'D', lastName: 'd', email: 'd@example.com' },
      { firstName: 'E', lastName: 'e', email: 'e@example.com' },
    ];

    await render(
      <template>
        <Table
          @data={{data}}
          @nextButtonLabel="Next"
          @previousButtonLabel="Previous"
          @viewingLabel="Viewing"
          @ofLabel="of"
          @resultsLabel="results"
          as |table|
        >
          <table.header as |header|>
            <header.column @prop="email">
              Email
            </header.column>
            <header.column @prop="firstName">
              First Name
            </header.column>
            <header.column @prop="lastName">
              Last Name
            </header.column>
          </table.header>
          <table.body />
        </Table>
      </template>,
    );

    assert.dom('thead tr th:nth-of-type(1)').hasText('Email');
    assert.dom('thead tr th:nth-of-type(2)').hasText('First Name');
    assert.dom('thead tr th:nth-of-type(3)').hasText('Last Name');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('a@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('A');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('a');

    assert
      .dom('tbody tr:nth-of-type(2) td:nth-of-type(1)')
      .hasText('b@example.com');
    assert.dom('tbody tr:nth-of-type(2) td:nth-of-type(2)').hasText('B');
    assert.dom('tbody tr:nth-of-type(2) td:nth-of-type(3)').hasText('b');

    assert
      .dom('tbody tr:nth-of-type(3) td:nth-of-type(1)')
      .hasText('c@example.com');
    assert.dom('tbody tr:nth-of-type(3) td:nth-of-type(2)').hasText('C');
    assert.dom('tbody tr:nth-of-type(3) td:nth-of-type(3)').hasText('c');

    assert
      .dom('tbody tr:nth-of-type(4) td:nth-of-type(1)')
      .hasText('d@example.com');
    assert.dom('tbody tr:nth-of-type(4) td:nth-of-type(2)').hasText('D');
    assert.dom('tbody tr:nth-of-type(4) td:nth-of-type(3)').hasText('d');

    assert
      .dom('tbody tr:nth-of-type(5) td:nth-of-type(1)')
      .hasText('e@example.com');
    assert.dom('tbody tr:nth-of-type(5) td:nth-of-type(2)').hasText('E');
    assert.dom('tbody tr:nth-of-type(5) td:nth-of-type(3)').hasText('e');

    assert.dom('tbody tr:nth-of-type(6)').doesNotExist();
  });

  test('it renders sortable', async function (assert) {
    const data = [
      { firstName: 'A', lastName: 'a', email: 'a@example.com' },
      { firstName: 'B', lastName: 'b', email: 'b@example.com' },
      { firstName: 'C', lastName: 'c', email: 'c@example.com' },
      { firstName: 'D', lastName: 'd', email: 'd@example.com' },
      { firstName: 'E', lastName: 'e', email: 'e@example.com' },
    ];

    await render(
      <template>
        <Table
          @data={{data}}
          @isSortable={{true}}
          @nextButtonLabel="Next"
          @previousButtonLabel="Previous"
          @viewingLabel="Viewing"
          @ofLabel="of"
          @resultsLabel="results"
          as |table|
        >
          <table.header as |header|>
            <header.column @prop="email">
              Email
            </header.column>
            <header.column @prop="firstName">
              First Name
            </header.column>
            <header.column @prop="lastName">
              Last Name
            </header.column>
          </table.header>
          <table.body />
        </Table>
      </template>,
    );

    assert.dom('thead tr th:nth-of-type(1)').hasText('Email');
    assert.dom('thead tr th:nth-of-type(2)').hasText('First Name');
    assert.dom('thead tr th:nth-of-type(3)').hasText('Last Name');

    await click('thead tr th:nth-of-type(1)');
    await click('thead tr th:nth-of-type(1)');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('e@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('E');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('e');

    assert
      .dom('tbody tr:nth-of-type(2) td:nth-of-type(1)')
      .hasText('d@example.com');
    assert.dom('tbody tr:nth-of-type(2) td:nth-of-type(2)').hasText('D');
    assert.dom('tbody tr:nth-of-type(2) td:nth-of-type(3)').hasText('d');

    assert
      .dom('tbody tr:nth-of-type(3) td:nth-of-type(1)')
      .hasText('c@example.com');
    assert.dom('tbody tr:nth-of-type(3) td:nth-of-type(2)').hasText('C');
    assert.dom('tbody tr:nth-of-type(3) td:nth-of-type(3)').hasText('c');

    assert
      .dom('tbody tr:nth-of-type(4) td:nth-of-type(1)')
      .hasText('b@example.com');
    assert.dom('tbody tr:nth-of-type(4) td:nth-of-type(2)').hasText('B');
    assert.dom('tbody tr:nth-of-type(4) td:nth-of-type(3)').hasText('b');

    assert
      .dom('tbody tr:nth-of-type(5) td:nth-of-type(1)')
      .hasText('a@example.com');
    assert.dom('tbody tr:nth-of-type(5) td:nth-of-type(2)').hasText('A');
    assert.dom('tbody tr:nth-of-type(5) td:nth-of-type(3)').hasText('a');

    assert.dom('tbody tr:nth-of-type(6)').doesNotExist();
  });

  test('it renders local pagination', async function (assert) {
    const data = [
      { firstName: 'A', lastName: 'a', email: 'a@example.com' },
      { firstName: 'B', lastName: 'b', email: 'b@example.com' },
      { firstName: 'C', lastName: 'c', email: 'c@example.com' },
      { firstName: 'D', lastName: 'd', email: 'd@example.com' },
      { firstName: 'E', lastName: 'e', email: 'e@example.com' },
      { firstName: 'F', lastName: 'f', email: 'f@example.com' },
      { firstName: 'G', lastName: 'g', email: 'g@example.com' },
      { firstName: 'H', lastName: 'h', email: 'h@example.com' },
      { firstName: 'I', lastName: 'i', email: 'i@example.com' },
      { firstName: 'J', lastName: 'j', email: 'j@example.com' },
      { firstName: 'K', lastName: 'k', email: 'k@example.com' },
      { firstName: 'L', lastName: 'l', email: 'l@example.com' },
      { firstName: 'M', lastName: 'm', email: 'm@example.com' },
      { firstName: 'N', lastName: 'n', email: 'n@example.com' },
      { firstName: 'O', lastName: 'o', email: 'o@example.com' },
      { firstName: 'P', lastName: 'p', email: 'p@example.com' },
      { firstName: 'Q', lastName: 'q', email: 'q@example.com' },
      { firstName: 'R', lastName: 'r', email: 'r@example.com' },
      { firstName: 'S', lastName: 's', email: 's@example.com' },
      { firstName: 'T', lastName: 't', email: 't@example.com' },
      { firstName: 'U', lastName: 'u', email: 'u@example.com' },
      { firstName: 'V', lastName: 'v', email: 'v@example.com' },
      { firstName: 'W', lastName: 'w', email: 'w@example.com' },
      { firstName: 'X', lastName: 'x', email: 'x@example.com' },
      { firstName: 'Y', lastName: 'y', email: 'y@example.com' },
      { firstName: 'Z', lastName: 'z', email: 'z@example.com' },
    ];

    await render(
      <template>
        <Table
          @data={{data}}
          @pagination="local"
          @nextButtonLabel="Next"
          @previousButtonLabel="Previous"
          @viewingLabel="Viewing"
          @ofLabel="of"
          @resultsLabel="results"
          as |table|
        >
          <table.header as |header|>
            <header.column @prop="email">
              Email
            </header.column>
            <header.column @prop="firstName">
              First Name
            </header.column>
            <header.column @prop="lastName">
              Last Name
            </header.column>
          </table.header>
          <table.body />
        </Table>
      </template>,
    );

    assert.dom('thead tr th:nth-of-type(1)').hasText('Email');
    assert.dom('thead tr th:nth-of-type(2)').hasText('First Name');
    assert.dom('thead tr th:nth-of-type(3)').hasText('Last Name');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('a@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('A');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('a');

    await click('[data-test-next]');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('k@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('K');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('k');

    await click('[data-test-next]');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('u@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('U');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('u');

    assert.dom('[data-test-pagination]').exists();
  });

  test('it renders cursor pagination', async function (assert) {
    const data = [
      { firstName: 'A', lastName: 'a', email: 'a@example.com' },
      { firstName: 'B', lastName: 'b', email: 'b@example.com' },
      { firstName: 'C', lastName: 'c', email: 'c@example.com' },
      { firstName: 'D', lastName: 'd', email: 'd@example.com' },
      { firstName: 'E', lastName: 'e', email: 'e@example.com' },
      { firstName: 'F', lastName: 'f', email: 'f@example.com' },
      { firstName: 'G', lastName: 'g', email: 'g@example.com' },
      { firstName: 'H', lastName: 'h', email: 'h@example.com' },
      { firstName: 'I', lastName: 'i', email: 'i@example.com' },
      { firstName: 'J', lastName: 'j', email: 'j@example.com' },
      { firstName: 'K', lastName: 'k', email: 'k@example.com' },
      { firstName: 'L', lastName: 'l', email: 'l@example.com' },
      { firstName: 'M', lastName: 'm', email: 'm@example.com' },
      { firstName: 'N', lastName: 'n', email: 'n@example.com' },
      { firstName: 'O', lastName: 'o', email: 'o@example.com' },
      { firstName: 'P', lastName: 'p', email: 'p@example.com' },
      { firstName: 'Q', lastName: 'q', email: 'q@example.com' },
      { firstName: 'R', lastName: 'r', email: 'r@example.com' },
      { firstName: 'S', lastName: 's', email: 's@example.com' },
      { firstName: 'T', lastName: 't', email: 't@example.com' },
      { firstName: 'U', lastName: 'u', email: 'u@example.com' },
      { firstName: 'V', lastName: 'v', email: 'v@example.com' },
      { firstName: 'W', lastName: 'w', email: 'w@example.com' },
      { firstName: 'X', lastName: 'x', email: 'x@example.com' },
      { firstName: 'Y', lastName: 'y', email: 'y@example.com' },
      { firstName: 'Z', lastName: 'z', email: 'z@example.com' },
    ];

    const onNext = () => {
      assert.ok(true);
    };
    const onPrevious = () => {
      assert.ok(true);
    };

    await render(
      <template>
        <Table
          @data={{data}}
          @pagination="cursor"
          @canNext={{false}}
          @canPrevious={{false}}
          @nextButtonLabel="Next"
          @previousButtonLabel="Previous"
          @viewingLabel="Viewing"
          @ofLabel="of"
          @resultsLabel="results"
          @onNext={{onNext}}
          @onPrevious={{onPrevious}}
          as |table|
        >
          <table.header as |header|>
            <header.column @prop="email">
              Email
            </header.column>
            <header.column @prop="firstName">
              First Name
            </header.column>
            <header.column @prop="lastName">
              Last Name
            </header.column>
          </table.header>
          <table.body />
        </Table>
      </template>,
    );

    assert.dom('thead tr th:nth-of-type(1)').hasText('Email');
    assert.dom('thead tr th:nth-of-type(2)').hasText('First Name');
    assert.dom('thead tr th:nth-of-type(3)').hasText('Last Name');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('a@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('A');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('a');
    assert
      .dom('tbody tr:nth-of-type(26) td:nth-of-type(1)')
      .hasText('z@example.com');
    assert.dom('tbody tr:nth-of-type(26) td:nth-of-type(2)').hasText('Z');
    assert.dom('tbody tr:nth-of-type(26) td:nth-of-type(3)').hasText('z');

    assert.dom('[data-test-pagination]').exists();
  });

  test('it renders offset pagination', async function (assert) {
    const state = tracked({ page: 0 });

    const getData = () => {
      const users = [
        { firstName: 'A', lastName: 'a', email: 'a@example.com' },
        { firstName: 'B', lastName: 'b', email: 'b@example.com' },
        { firstName: 'C', lastName: 'c', email: 'c@example.com' },
        { firstName: 'D', lastName: 'd', email: 'd@example.com' },
        { firstName: 'E', lastName: 'e', email: 'e@example.com' },
        { firstName: 'F', lastName: 'f', email: 'f@example.com' },
        { firstName: 'G', lastName: 'g', email: 'g@example.com' },
        { firstName: 'H', lastName: 'h', email: 'h@example.com' },
        { firstName: 'I', lastName: 'i', email: 'i@example.com' },
        { firstName: 'J', lastName: 'j', email: 'j@example.com' },
        { firstName: 'K', lastName: 'k', email: 'k@example.com' },
        { firstName: 'L', lastName: 'l', email: 'l@example.com' },
        { firstName: 'M', lastName: 'm', email: 'm@example.com' },
        { firstName: 'N', lastName: 'n', email: 'n@example.com' },
        { firstName: 'O', lastName: 'o', email: 'o@example.com' },
        { firstName: 'P', lastName: 'p', email: 'p@example.com' },
        { firstName: 'Q', lastName: 'q', email: 'q@example.com' },
        { firstName: 'R', lastName: 'r', email: 'r@example.com' },
        { firstName: 'S', lastName: 's', email: 's@example.com' },
        { firstName: 'T', lastName: 't', email: 't@example.com' },
        { firstName: 'U', lastName: 'u', email: 'u@example.com' },
        { firstName: 'V', lastName: 'v', email: 'v@example.com' },
        { firstName: 'W', lastName: 'w', email: 'w@example.com' },
        { firstName: 'X', lastName: 'x', email: 'x@example.com' },
        { firstName: 'Y', lastName: 'y', email: 'y@example.com' },
        { firstName: 'Z', lastName: 'z', email: 'z@example.com' },
        { firstName: 'AA', lastName: 'aa', email: 'aa@example.com' },
        { firstName: 'BB', lastName: 'bb', email: 'bb@example.com' },
        { firstName: 'CC', lastName: 'cc', email: 'cc@example.com' },
        { firstName: 'DD', lastName: 'dd', email: 'dd@example.com' },
        { firstName: 'EE', lastName: 'ee', email: 'ee@example.com' },
        { firstName: 'FF', lastName: 'ff', email: 'ff@example.com' },
        { firstName: 'GG', lastName: 'gg', email: 'gg@example.com' },
        { firstName: 'HH', lastName: 'hh', email: 'hh@example.com' },
        { firstName: 'II', lastName: 'ii', email: 'ii@example.com' },
        { firstName: 'JJ', lastName: 'jj', email: 'jj@example.com' },
        { firstName: 'KK', lastName: 'kk', email: 'kk@example.com' },
        { firstName: 'LL', lastName: 'll', email: 'll@example.com' },
        { firstName: 'MM', lastName: 'mm', email: 'mm@example.com' },
        { firstName: 'NN', lastName: 'nn', email: 'nn@example.com' },
        { firstName: 'OO', lastName: 'oo', email: 'oo@example.com' },
        { firstName: 'PP', lastName: 'pp', email: 'pp@example.com' },
        { firstName: 'QQ', lastName: 'qq', email: 'qq@example.com' },
        { firstName: 'RR', lastName: 'rr', email: 'rr@example.com' },
        { firstName: 'SS', lastName: 'ss', email: 'ss@example.com' },
        { firstName: 'TT', lastName: 'tt', email: 'tt@example.com' },
        { firstName: 'UU', lastName: 'uu', email: 'uu@example.com' },
        { firstName: 'VV', lastName: 'vv', email: 'vv@example.com' },
        { firstName: 'WW', lastName: 'ww', email: 'ww@example.com' },
        { firstName: 'XX', lastName: 'xx', email: 'xx@example.com' },
        { firstName: 'YY', lastName: 'yy', email: 'yy@example.com' },
        { firstName: 'ZZ', lastName: 'zz', email: 'zz@example.com' },
      ];
      const pageSize = 20;
      const page = state.page;
      const start = page * pageSize;
      const end = start + pageSize;
      return users.slice(start, end);
    };
    const _state = tracked({ data: getData() });

    const totalItems = 52;

    const onChangePage = (page: number) => {
      state.page = page;
      _state.data = getData();
    };

    await render(
      <template>
        <Table
          @data={{_state.data}}
          @pagination="offset"
          @page={{state.page}}
          @totalItems={{totalItems}}
          @nextButtonLabel="Next"
          @previousButtonLabel="Previous"
          @viewingLabel="Viewing"
          @ofLabel="of"
          @resultsLabel="results"
          @onChangePage={{onChangePage}}
          as |table|
        >
          <table.header as |header|>
            <header.column @prop="email">
              Email
            </header.column>
            <header.column @prop="firstName">
              First Name
            </header.column>
            <header.column @prop="lastName">
              Last Name
            </header.column>
          </table.header>
          <table.body />
        </Table>
      </template>,
    );

    assert.dom('thead tr th:nth-of-type(1)').hasText('Email');
    assert.dom('thead tr th:nth-of-type(2)').hasText('First Name');
    assert.dom('thead tr th:nth-of-type(3)').hasText('Last Name');

    assert.dom('ul li:nth-of-type(1)').hasText('Previous').hasClass('disabled');
    assert.dom('ul li:nth-of-type(2)').hasText('1');
    assert.dom('ul li:nth-of-type(3)').hasText('2');
    assert.dom('ul li:nth-of-type(4)').hasText('3');
    assert.dom('ul li:nth-of-type(5)').hasText('Next');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('a@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('A');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('a');

    await click('ul li:nth-of-type(4) a');
    assert
      .dom('tbody tr:nth-of-type(12) td:nth-of-type(1)')
      .hasText('zz@example.com');
    assert.dom('tbody tr:nth-of-type(12) td:nth-of-type(2)').hasText('ZZ');
    assert.dom('tbody tr:nth-of-type(12) td:nth-of-type(3)').hasText('zz');

    assert.dom('ul li:nth-of-type(5)').hasClass('disabled');

    await click('ul li:nth-of-type(3) a');
    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('u@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('U');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('u');

    assert.dom('[data-test-pagination]').exists();
  });
});
