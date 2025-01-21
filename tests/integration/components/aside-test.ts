import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { AsideSignature } from '@trusted-american/design-system/components/aside';

type Context = AsideSignature['Args'] & TestContext;

module('Integration | Component | aside', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.isCollapsed = false;

    await render<Context>(hbs`
      <Aside @title='Title' @logo='' @route='' @isCollapsed={{this.isCollapsed}} @onChange={{fn (mut this.isCollapsed)}}>
        <:default>
          Default
        </:default>
        <:footer>
          Bottom
        </:footer>
      </Aside>
    `);

    assert.dom('aside').hasText('Title Default Bottom');

    assert.dom('aside').doesNotHaveClass('collapsed');

    await click('button');

    assert.dom('aside').hasClass('collapsed');
  });
});
