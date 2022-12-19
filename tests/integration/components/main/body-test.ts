import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

type Context = TestContext;

module('Integration | Component | main/body', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render(hbs`
      <Main::Body>
        template block text
      </Main::Body>
    `);

    assert.dom(this.element as Element).hasText('template block text');
    assert.dom('article').hasClass('container-fluid');
  });
});
