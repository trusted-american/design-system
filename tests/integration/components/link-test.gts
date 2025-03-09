import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Link } from '@trusted-american/design-system';

module('Integration | Component | link', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Link @route="application">
          Label
        </Link>
      </template>,
    );

    assert.dom('a').exists();
    assert.dom('a').hasText('Label');
  });

  test('it supports label arg', async function (assert) {
    await render(
      <template><Link @route="application" @label="Label" /></template>,
    );

    assert.dom('a').exists();
    assert.dom('a').hasText('Label');
  });

  test('it supports external links', async function (assert) {
    const href = 'https://www.google.com/';

    await render(
      <template>
        <Link @href={{href}}>
          Label
        </Link>
      </template>,
    );

    assert.dom('a').hasAttribute('href', href);
    assert.dom('a').hasAttribute('target', '_blank');
    assert.dom('a').hasAttribute('rel', 'noopener noreferrer');
    assert.dom('a').hasText('Label');
  });
});
