import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | table', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<TestContext>(hbs`
      <Table @data={{(array)}} as |table|>
        <table.header as |header|>
          <header.column @prop='email'>
            Email
          </header.column>
          <header.column @prop='firstName'>
            First Name
          </header.column>
          <header.column @prop='lastName'>
            Last Name
          </header.column>
        </table.header>
        <table.body />
      </Table>
    `);

    assert.dom().hasText('Email First Name Last Name');
  });
});
