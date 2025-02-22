import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { Heading } from '@trusted-american/design-system';

import type { HeadingSignature } from '@trusted-american/design-system/components/heading';

type Context = HeadingSignature['Args'] & TestContext;

module('Integration | Component | heading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.title = 'Title';
    this.subtitle = undefined;
    this.type = undefined;
    this.identifier = undefined;

    await render<Context>(
      <template>
        <Heading
          @title={{this.title}}
          @subtitle={{this.subtitle}}
          @type={{this.type}}
          @identifier={{this.identifier}}
        />
      </template>,
    );

    assert.dom().hasText('Title');

    this.set('subtitle', 'Subtitle');

    assert.dom().hasText('Title Subtitle');

    this.set('type', 'Agent');
    this.set('identifier', '1');

    assert.dom().hasText('Agent 1 Title Subtitle');

    await render<Context>(
      <template>
        <Heading
          @title={{this.title}}
          @subtitle={{this.subtitle}}
          @type={{this.type}}
          @identifier={{this.identifier}}
        >
          template block text
        </Heading>
      </template>,
    );

    assert.dom().hasText('Agent 1 Title template block text Subtitle');
  });
});
