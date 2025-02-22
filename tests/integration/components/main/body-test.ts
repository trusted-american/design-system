import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

type Context = TestContext;

module('Integration | Component | main/body', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render(<template>
      <Main::Body>
        template block text
      </Main::Body>
    </template>);

    assert.dom('article').hasText('template block text');
    assert.dom('article').hasClass('container-fluid');
  });
});
