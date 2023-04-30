import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import Heading from '@trusted-american/design-system/components/heading';

module('Integration | Component | heading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const title = 'Title';
    const subtitle = undefined;
    const type = undefined;
    const code = undefined;

    await render(<template>
      <Heading
        @title={{title}}
        @subtitle={{subtitle}}
        @type={{type}}
        @code={{code}}
      />
    </template>);

    assert.dom().hasText('Title');

    this.set('subtitle', 'Subtitle');

    assert.dom().hasText('Title Subtitle');

    this.set('type', 'Agent');
    this.set('code', '1');

    assert.dom().hasText('Agent 1 Title Subtitle');

    await render(<template>
      <Heading
        @title={{title}}
        @subtitle={{subtitle}}
        @type={{type}}
        @code={{code}}
      >
        template block text
      </Heading>
    </template>);

    assert.dom().hasText('Agent 1 Title Subtitle template block text');
  });
});
