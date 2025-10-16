import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, rerender } from '@ember/test-helpers';
import { FileType } from '@trusted-american/design-system';
import { tracked } from '@glimmer/tracking';
import type { SizeProp } from '@fortawesome/fontawesome-svg-core';

module('Integration | Component | file-type', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked size?: SizeProp;
    }
    const state = new State();

    await render(
      <template><FileType @name="file.pdf" @size={{state.size}} /></template>,
    );

    assert.dom('[data-test-icon]').hasClass('fa-file-pdf');
    assert.dom('[data-test-icon]').hasClass('text-danger');
    assert.dom('[data-test-icon]').doesNotHaveClass('fa-lg');

    state.size = 'lg';
    await rerender();

    assert.dom('[data-test-icon]').hasClass('fa-lg');
  });
});
