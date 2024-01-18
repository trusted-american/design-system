import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FileTypeSignature } from '@trusted-american/design-system/components/file-type';

type Context = FileTypeSignature['Args'] & TestContext;

module('Integration | Component | file-type', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.name = 'file.pdf';
    this.size = undefined;

    await render<Context>(
      hbs`<FileType @name={{this.name}} @size={{this.size}} />`,
    );

    assert.dom('svg').hasClass('fa-file-pdf');
    assert.dom('svg').hasClass('text-danger');
    assert.dom('svg').doesNotHaveClass('fa-lg');

    this.set('size', 'lg');

    assert.dom('svg').hasClass('fa-lg');
  });
});
