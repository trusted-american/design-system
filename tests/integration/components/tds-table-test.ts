import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | tds-table', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<TestContext>(hbs`
      <TdsTable @data={{(array)}} as |table|>
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
      </TdsTable>
    `);

    assert.dom().hasText('template block text');
  });
});
