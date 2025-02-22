import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { Subheading } from '@trusted-american/design-system';

import type { SubheadingSignature } from '@trusted-american/design-system/components/subheading';

type Context = SubheadingSignature['Args'] & TestContext;

module('Integration | Component | subheading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.title = 'Title';

    await render<Context>(
      <template><Subheading @title={{this.title}} /></template>,
    );

    assert.dom().hasText('Title');

    await render<Context>(
      <template>
        <Subheading @title={{this.title}}>
          template block text
        </Subheading>
      </template>,
    );

    assert.dom().hasText('Title template block text');
  });
});
