import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

type Context = TestContext;

module('Integration | Component | main/footer', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render(<template>
      <Main::Footer>
        template block text
      </Main::Footer>
    </template>);

    assert.dom('footer').hasText('template block text');
    assert.dom('footer').hasClass('container-fluid');
  });
});
