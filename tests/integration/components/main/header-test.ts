import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

type Context = TestContext;

module('Integration | Component | main/header', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render(<template>
      <Main::Header>
        template block text
      </Main::Header>
    </template>);

    assert.dom('header').hasText('template block text');
    assert.dom('header').hasClass('container-fluid');
  });
});
