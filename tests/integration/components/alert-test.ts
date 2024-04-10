import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | alert', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Alert>
        <:title>Title here</:title>
        <:default>Body here</:default>
      </Alert>
    `);

    assert.dom().hasText('Title here Body here');
  });
});
