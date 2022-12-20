import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, find, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { AvatarComponentSignature } from '@trusted-american/design-system/components/avatar';

type Context = AvatarComponentSignature['Args'] & TestContext;

module('Integration | Component | avatar', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
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

    const img = find<HTMLImageElement>('[data-test-avatar]');
    assert.true(img?.src.includes('data:image/png'));
    assert.dom('[data-test-avatar]').hasAttribute('alt', this.alt);
    assert.dom('[data-test-avatar]').hasStyle({
      width: '64px',
      height: '64px',
    });

    this.set('url', 'https://via.placeholder.com/350x150');

    assert
      .dom('[data-test-avatar]')
      .hasAttribute('src', this.url as unknown as string);

    this.set('size', 2);

    assert.dom('[data-test-avatar]').hasStyle({
      width: '32px',
      height: '32px',
    });
  });
});
