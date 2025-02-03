import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FlyoutSignature } from '@trusted-american/design-system/components/flyout';

type Context = FlyoutSignature['Args'] & TestContext;

module('Integration | Component | flyout', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.onClose = () => {};

    await render<Context>(hbs`
      <Flyout
        @title="Title"
        @closeText="Close"
        @onClose={{this.onClose}}
      >
        Body
      </Flyout>
    `);

    assert.dom().hasText('Title Body');
  });
});
