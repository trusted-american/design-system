import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { SubheadingComponentSignature } from '@trusted-american/design-system/components/subheading';

type Context = SubheadingComponentSignature['Args'] & TestContext;

module('Integration | Component | subheading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.title = 'Title';

    await render<Context>(hbs`<Subheading @title={{this.title}} />`);

    assert.dom().hasText('Title');

    await render<Context>(hbs`
      <Subheading @title={{this.title}}>
        template block text
      </Subheading>
    `);

    assert.dom().hasText('Title template block text');
  });
});
