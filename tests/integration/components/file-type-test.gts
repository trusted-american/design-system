import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, rerender } from '@ember/test-helpers';
import FileType from '@trusted-american/design-system/components/file-type';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | file-type', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{
      name: string;
      size?: string;
    }>({
      name: 'file.pdf',
      size: undefined,
    });

    await render(<template>
      <FileType @name={{state.name}} @size={{state.size}} />
    </template>);

    assert.dom('svg').hasClass('fa-file-pdf');
    assert.dom('svg').hasClass('text-danger');
    assert.dom('svg').doesNotHaveClass('fa-lg');

    state.size = 'lg';
    await rerender();

    assert.dom('svg').hasClass('fa-lg');
  });
});
