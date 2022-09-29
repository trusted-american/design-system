import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

// interface Context extends TestContext {
//   url: string;
// }

module('Integration | Component | external-link', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    this.url = 'https://www.google.com/';

    await render(hbs`
      <ExternalLink @url={{this.url}}>
        template block text
      </ExternalLink>
    `);

    assert.dom('a').hasAttribute('href', this.url);
    assert.dom('a').hasAttribute('target', '_blank');
    assert.dom('a').hasAttribute('rel', 'noopener noreferrer');
    assert.dom('a').hasText('template block text');
  });
});
