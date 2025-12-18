import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { theme } from '@trusted-american/ember';

module('Integration | Helper | theme', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders light', async function (assert) {
    await render(<template>{{theme "light"}}</template>);

    assert.strictEqual(
      document.documentElement.getAttribute('data-bs-theme'),
      'light',
    );
  });

  test('it renders dark', async function (assert) {
    await render(<template>{{theme "dark"}}</template>);

    assert.strictEqual(
      document.documentElement.getAttribute('data-bs-theme'),
      'dark',
    );
  });
});
