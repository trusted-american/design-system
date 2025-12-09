import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { StatCard } from '@trusted-american/design-system';
import { faUser } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | stat-card', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><StatCard @label="Key" @value="Value" /></template>);

    assert.dom('p').hasText('Key');
    assert.dom('h1').hasText('Value');
  });

  test('it renders icons', async function (assert) {
    await render(
      <template>
        <StatCard @label="Key" @value="Value" @icon={{faUser}} />
      </template>,
    );

    assert.dom('p').hasText('Key');
    assert.dom('h1').hasText('Value');
    assert.dom('[data-test-icon]').exists();
  });

  test('route works', async function (assert) {
    await render(
      <template>
        <StatCard @label="Key" @value="Value" @icon={{faUser}} @route="index" />
      </template>,
    );

    assert.dom('p').hasText('Key');
    assert.dom('h1').hasText('Value');
    assert.dom('[data-test-icon]').exists();
    assert.dom('[data-test-link]').exists();
  });
});
