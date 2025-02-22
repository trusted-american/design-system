import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { ExternalLink } from '@trusted-american/design-system';

import type { ExternalLinkSignature } from '@trusted-american/design-system/components/external-link';

type Context = ExternalLinkSignature['Args'] & TestContext;

module('Integration | Component | external-link', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.href = 'https://www.google.com/';

    await render<Context>(
      <template>
        <ExternalLink @href={{this.href}}>
          template block text
        </ExternalLink>
      </template>,
    );

    assert.dom('a').hasAttribute('href', this.href);
    assert.dom('a').hasAttribute('target', '_blank');
    assert.dom('a').hasAttribute('rel', 'noopener noreferrer');
    assert.dom('a').hasText('template block text');
  });
});
