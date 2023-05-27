import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { AsideSignature } from '@trusted-american/design-system/components/aside';

type Context = AsideSignature['Args'] & TestContext;

module('Integration | Component | aside', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<Context>(hbs`
      <Aside @title="Title" @logo="" @route="">
        <:default>
          Default
        </:default>
        <:bottom>
          Bottom
        </:bottom>
      </Aside>
    `);

    assert.dom('aside').hasText('Title Default Bottom');
  });
});
