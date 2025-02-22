import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { Flyout } from '@trusted-american/design-system';

import type { FlyoutSignature } from '@trusted-american/design-system/components/flyout';

type Context = FlyoutSignature['Args'] & TestContext;

module('Integration | Component | flyout', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.onClose = () => {};

    await render<Context>(
      <template>
        <Flyout
          @title="Title"
          @closeButtonLabel="Close"
          @onClose={{this.onClose}}
        >
          Body
        </Flyout>
      </template>,
    );

    assert.dom().hasText('Title Body');
  });
});
