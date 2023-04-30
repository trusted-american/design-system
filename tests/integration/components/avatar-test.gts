import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, find } from '@ember/test-helpers';
import Avatar from '@trusted-american/design-system/components/avatar';

module('Integration | Component | avatar', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const id = '012345678901234';
    const url = undefined;
    const alt = 'Name';
    const size = undefined;

    await render(<template>
      <Avatar @id={{id}} @url={{url}} @alt={{alt}} @size={{size}} />
    </template>);

    const img = find('[data-test-avatar]') as HTMLImageElement | null;
    assert.true(img?.src.includes('data:image/png'));
    assert.dom('[data-test-avatar]').hasAttribute('alt', alt);
    assert.dom('[data-test-avatar]').hasStyle({
      width: '56px',
      height: '56px',
    });

    this.set('url', 'https://via.placeholder.com/350x150');

    assert
      .dom('[data-test-avatar]')
      .hasAttribute('src', url as unknown as string);

    this.set('size', 2);

    assert.dom('[data-test-avatar]').hasStyle({
      width: '28px',
      height: '28px',
    });
  });
});
