import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, rerender } from '@ember/test-helpers';
import Heading from '@trusted-american/design-system/components/heading';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | heading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{
      title: string;
      subtitle?: string;
      type?: string;
      code?: string;
    }>({
      title: 'Title',
    });

    await render(<template>
      <Heading
        @title={{state.title}}
        @subtitle={{state.subtitle}}
        @type={{state.type}}
        @code={{state.code}}
      />
    </template>);

    assert.dom().hasText('Title');

    state.subtitle = 'Subtitle';
    await rerender();

    assert.dom().hasText('Title Subtitle');

    state.type = 'Agent';
    state.code = '1';
    await rerender();

    assert.dom().hasText('Agent 1 Title Subtitle');

    await render(<template>
      <Heading
        @title={{state.title}}
        @subtitle={{state.subtitle}}
        @type={{state.type}}
        @code={{state.code}}
      >
        template block text
      </Heading>
    </template>);

    assert.dom().hasText('Agent 1 Title Subtitle template block text');
  });
});
