import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import FileType from '@trusted-american/design-system/components/file-type';

module('Integration | Component | file-type', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const name = 'file.pdf';
    const size = undefined;

    await render(<template>
      <FileType @name={{name}} @size={{size}} />
    </template>);

    assert.dom('svg').hasClass('fa-file-pdf');
    assert.dom('svg').hasClass('text-danger');
    assert.dom('svg').doesNotHaveClass('fa-lg');

    this.set('size', 'lg');

    assert.dom('svg').hasClass('fa-lg');
  });
});
