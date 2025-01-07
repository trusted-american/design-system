import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

interface Context extends TestContext {
  inputValue: Date;
}

module('Integration | Helper | from-now', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    this.inputValue = date;

    await render<Context>(hbs`{{from-now this.inputValue}}`);

    assert.dom().hasText('a year ago');
  });

  test('short works', async function (this: Context, assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    this.inputValue = date;

    await render<Context>(hbs`{{from-now this.inputValue isCompact=true}}`);

    assert.dom().hasText('1Y');
  });

  test('object reference quirks are compensated for', async function (this: Context, assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    this.inputValue = date;

    await render<Context>(hbs`
      {{from-now this.inputValue isCompact=true}}
      {{from-now this.inputValue}}
      {{from-now this.inputValue isCompact=true}}
    `);

    assert.dom().hasText('1Y a year ago 1Y');
  });
});
