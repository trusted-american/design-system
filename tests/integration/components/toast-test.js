import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | toast', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Toast>
        <:title>Title</:title>
        <:body>Body</:body>
      </Toast>
    `);

    assert.dom(this.element).hasText('Title Body');
  });
});
