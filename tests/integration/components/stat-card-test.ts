import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, currentRouteName, render, waitFor } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | stat-card', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`<StatCard @label="Key" @value="Value"/>`);
    assert.dom('p').hasText('Key');
    assert.dom('h1').hasText('Value');
  });

  test('it renders icons', async function (assert) {
    await render(hbs`<StatCard @label="Key" @value="Value" @icon="user"  />`);
    assert.dom('p').hasText('Key');
    assert.dom('h1').hasText('Value');
    assert.dom('svg').exists();
  });

  test('path works', async function (assert) {
    await render(
      hbs`<StatCard @label="Key" @value="Value" @icon="user" @route='index'/>`,
    );
    assert.dom('p').hasText('Key');
    assert.dom('h1').hasText('Value');
    assert.dom('svg').exists();

    await waitFor('a', { timeout: 5000 });
    await click('a');

    assert.strictEqual(currentRouteName(), 'index');
  });
});
