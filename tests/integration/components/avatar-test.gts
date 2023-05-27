import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, rerender, find } from '@ember/test-helpers';
import Avatar from '@trusted-american/design-system/components/avatar';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | avatar', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{
      id: string;
      url?: string;
      alt: string;
      size?: number;
    }>({
      id: '012345678901234',
      url: undefined,
      alt: 'Name',
      size: undefined,
    });

    await render(<template>
      <Avatar
        @id={{state.id}}
        @url={{state.url}}
        @alt={{state.alt}}
        @size={{state.size}}
      />
    </template>);

    const img = find('[data-test-avatar]') as HTMLImageElement | null;
    assert.true(img?.src.includes('data:image/png'));
    assert.dom('[data-test-avatar]').hasAttribute('alt', state.alt);
    assert.dom('[data-test-avatar]').hasStyle({
      width: '56px',
      height: '56px',
    });

    state.url = 'https://via.placeholder.com/350x150';
    await rerender();

    assert.dom('[data-test-avatar]').hasAttribute('src', state.url);

    state.size = 2;
    await rerender();

    assert.dom('[data-test-avatar]').hasStyle({
      width: '28px',
      height: '28px',
    });
  });
});
