import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { ExternalLinkComponentSignature } from '@trusted-american/design-system/components/external-link';

type Context = ExternalLinkComponentSignature['Args'] & TestContext;

module('Integration | Component | external-link', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.href = 'https://www.google.com/';

    await render<Context>(hbs`
      <ExternalLink @href={{this.href}}>
        template block text
      </ExternalLink>
    `);

    assert.dom('a').hasAttribute('href', this.href);
    assert.dom('a').hasAttribute('target', '_blank');
    assert.dom('a').hasAttribute('rel', 'noopener noreferrer');
    assert.dom('a').hasText('template block text');
  });
});
