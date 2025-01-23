import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

interface Context extends TestContext {
  fn: () => void;
}

module('Integration | Modifier | did-insert', function (hooks) {
  setupRenderingTest(hooks);

  // Replace this with your real tests.
  test('it renders', async function (this: Context, assert) {
    this.fn = () => {};

    await render<Context>(hbs`<div {{did-insert this.fn}}></div>`);

    assert.ok(true);
  });
});
