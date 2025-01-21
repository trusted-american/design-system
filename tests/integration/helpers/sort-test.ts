import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

interface Context extends TestContext {
  inputValue: string[];
}

module('Integration | Helper | sort', function (hooks) {
  setupRenderingTest(hooks);

  // TODO: Replace this with your real tests.
  test('it renders', async function (this: Context, assert) {
    this.set('inputValue', ['a', 'c', 'b']);

    await render(hbs`{{#each (sort this.inputValue) as |value|}}
    {{value}}
  {{/each}}`);

    assert.dom().hasText('1234');
  });
});
