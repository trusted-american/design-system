import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, find } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | avatar', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    this.id = '012345678901234';
    this.url = undefined;
    this.alt = 'Name';
    this.size = undefined;

    await render(hbs`
      <Avatar
        @id={{this.id}}
        @url={{this.url}}
        @alt={{this.alt}}
        @size={{this.size}}
      />
    `);

    const img = find('[data-test-avatar]');
    assert.true(img?.src.includes('data:image/png'));
    assert.dom('[data-test-avatar]').hasAttribute('alt', this.alt);
    assert.dom('[data-test-avatar]').hasStyle({
      width: '64px',
      height: '64px',
    });

    this.set('url', 'https://via.placeholder.com/350x150');

    assert.dom('[data-test-avatar]').hasAttribute('src', this.url);

    this.set('size', 2);

    assert.dom('[data-test-avatar]').hasStyle({
      width: '32px',
      height: '32px',
    });
  });
});
