import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | tds-table', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<TestContext>(hbs`
      {{! @glint-ignore }}
      <TdsTable>
        template block text
      </TdsTable>
    `);

    assert.dom().hasText('template block text');
  });
});
