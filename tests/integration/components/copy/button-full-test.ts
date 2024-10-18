import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | copy/button-full', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Copy::ButtonFull @text='Text'>
        template block text
      </Copy::ButtonFull>
    `);

    assert.dom().hasText('template block text');
  });
});
