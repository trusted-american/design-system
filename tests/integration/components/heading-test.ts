import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { HeadingSignature } from '@trusted-american/design-system/components/heading';

type Context = HeadingSignature['Args'] & TestContext;

module('Integration | Component | heading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.title = 'Title';
    this.subtitle = undefined;
    this.type = undefined;
    this.code = undefined;

    await render<Context>(hbs`
      <Heading
        @title={{this.title}}
        @subtitle={{this.subtitle}}
        @type={{this.type}}
        @code={{this.code}}
      />
    `);

    assert.dom().hasText('Title');

    this.set('subtitle', 'Subtitle');

    assert.dom().hasText('Title Subtitle');

    this.set('type', 'Agent');
    this.set('code', '1');

    assert.dom().hasText('Agent 1 Title Subtitle');

    await render<Context>(hbs`
      <Heading
        @title={{this.title}}
        @subtitle={{this.subtitle}}
        @type={{this.type}}
        @code={{this.code}}
      >
        template block text
      </Heading>
    `);

    assert.dom().hasText('Agent 1 Title Subtitle template block text');
  });
});
