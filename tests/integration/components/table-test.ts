import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';
import type { TableSignature } from '@trusted-american/design-system/components/table';
import type { User } from 'dummy/tests/dummy/app/routes/comps/table';

type Context = TableSignature<User>['Args'] & TestContext;
module('Integration | Component | table', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.data = [
      { firstName: 'A', lastName: 'a', email: 'a@example.com' },
      { firstName: 'B', lastName: 'b', email: 'b@example.com' },
      { firstName: 'C', lastName: 'c', email: 'c@example.com' },
      { firstName: 'D', lastName: 'd', email: 'd@example.com' },
      { firstName: 'E', lastName: 'e', email: 'e@example.com' },
    ];

    await render<Context>(hbs`
      <Table @data={{this.data}} @nextText="Next" @previousText="Previous" as |table|>
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
    `);

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

  test('it renders sortable', async function (this: Context, assert) {
    this.data = [
      { firstName: 'A', lastName: 'a', email: 'a@example.com' },
      { firstName: 'B', lastName: 'b', email: 'b@example.com' },
      { firstName: 'C', lastName: 'c', email: 'c@example.com' },
      { firstName: 'D', lastName: 'd', email: 'd@example.com' },
      { firstName: 'E', lastName: 'e', email: 'e@example.com' },
    ];

    await render<Context>(hbs`
      <Table @data={{this.data}} @isSortable={{true}} @nextText="Next" @previousText="Previous" as |table|>
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
    `);

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

  test('it renders local pagination', async function (this: Context, assert) {
    this.data = [
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

    await render<Context>(hbs`
      <Table @data={{this.data}} @nextText="Next" @previousText="Previous" @pagination="local" as |table|>
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
    `);

    assert.dom('thead tr th:nth-of-type(1)').hasText('Email');
    assert.dom('thead tr th:nth-of-type(2)').hasText('First Name');
    assert.dom('thead tr th:nth-of-type(3)').hasText('Last Name');
    assert.dom('button:nth-of-type(1)').hasText('Previous').isDisabled();
    assert.dom('button:nth-of-type(2)').hasText('Next');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('a@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('A');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('a');

    await click('button:nth-of-type(2)');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('k@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('K');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('k');

    await click('button:nth-of-type(2)');

    assert
      .dom('tbody tr:nth-of-type(1) td:nth-of-type(1)')
      .hasText('u@example.com');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(2)').hasText('U');
    assert.dom('tbody tr:nth-of-type(1) td:nth-of-type(3)').hasText('u');
    assert.dom('button:nth-of-type(2)').isDisabled();

    await click('button:nth-of-type(1)');

    assert.dom('button:nth-of-type(1)').isEnabled();
    assert.dom('button:nth-of-type(2)').isEnabled();
  });

  test('it renders cursor pagination', async function (this: Context, assert) {
    this.data = [
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

    await render<Context>(hbs`
      <Table @data={{this.data}} @nextText="Next" @previousText="Previous" @pagination="cursor" @canNext={{false}}
      @canPrevious={{false}} as |table|>
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
    `);

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
  });
});
