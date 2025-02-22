import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, rerender, find } from '@ember/test-helpers';
import { Avatar } from '@trusted-american/design-system';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | avatar', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{
      url: string | undefined;
      size: number | undefined;
    }>({ url: undefined, size: undefined });

    await render(
      <template>
        <Avatar
          @id="012345678901234"
          @url={{state.url}}
          @alt="Name"
          @size={{state.size}}
        />
      </template>,
    );

    const img = find('[data-test-avatar]') as HTMLImageElement | null;
    assert.true(img?.src.includes('data:image/png'));
    assert.dom('[data-test-avatar]').hasAttribute('alt', 'Name');
    assert.dom('[data-test-avatar]').hasStyle({
      width: '64px',
      height: '64px',
    });

    state.url = 'https://via.placeholder.com/350x150';
    await rerender();

    assert
      .dom('[data-test-avatar]')
      .hasAttribute('src', 'https://via.placeholder.com/350x150');

    state.size = 2;
    await rerender();

    assert.dom('[data-test-avatar]').hasStyle({
      width: '32px',
      height: '32px',
    });
  });
});
