import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, rerender } from '@ember/test-helpers';
import { FileType } from '@trusted-american/design-system';
import { tracked } from 'tracked-built-ins';

import type { SizeProp } from '@fortawesome/fontawesome-svg-core';

module('Integration | Component | file-type', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{ size: SizeProp | undefined }>({ size: undefined });

    await render(
      <template><FileType @name="file.pdf" @size={{state.size}} /></template>,
    );

    assert.dom('svg').hasClass('fa-file-pdf');
    assert.dom('svg').hasClass('text-danger');
    assert.dom('svg').doesNotHaveClass('fa-lg');

    state.size = 'lg';
    await rerender();

    assert.dom('svg').hasClass('fa-lg');
  });
});
