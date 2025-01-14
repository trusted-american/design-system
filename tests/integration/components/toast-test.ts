import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render, waitFor } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | toast', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Toast @closeText="Close" @onClose={{(noop)}}>
        <:title>Title</:title>
        <:body>Body</:body>
      </Toast>
    `);

    assert.dom('[data-test-toast]').hasClass('show');
    assert.dom('.toast-header').hasText('Title');
    assert.dom('.toast-body').hasText('Body');
    assert.dom('button').exists();
    await click('button');
    await waitFor('.hide');
    assert.dom('[data-test-toast]').hasClass('hide');
  });
});
