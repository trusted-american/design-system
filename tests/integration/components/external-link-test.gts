import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import ExternalLink from '@trusted-american/design-system/components/external-link';

module('Integration | Component | external-link', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const url = 'https://www.google.com/';

    await render(<template>
      <ExternalLink @url={{url}}>
        template block text
      </ExternalLink>
    </template>);

    assert.dom('a').hasAttribute('href', url);
    assert.dom('a').hasAttribute('target', '_blank');
    assert.dom('a').hasAttribute('rel', 'noopener noreferrer');
    assert.dom('a').hasText('template block text');
  });
});
