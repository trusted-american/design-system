import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | aside', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Aside>
        <:default>
          Default
        </:default>
        <:bottom>
          Bottom
        </:bottom>
      </Aside>
    `);

    assert.dom(this.element as Element).hasText('Default Bottom');
  });
});
