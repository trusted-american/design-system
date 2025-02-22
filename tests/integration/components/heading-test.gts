import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Heading } from '@trusted-american/design-system';
import { tracked } from 'tracked-built-ins';
import { rerender } from '@ember/test-helpers';

module('Integration | Component | heading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{
      title: string;
      subtitle: string | undefined;
      type: string | undefined;
      identifier: string | undefined;
    }>({
      title: 'Title',
      subtitle: undefined,
      type: undefined,
      identifier: undefined,
    });

    await render(
      <template>
        <Heading
          @title={{state.title}}
          @subtitle={{state.subtitle}}
          @type={{state.type}}
          @identifier={{state.identifier}}
        />
      </template>,
    );

    assert.dom().hasText('Title');

    state.subtitle = 'Subtitle';
    await rerender();

    assert.dom().hasText('Title Subtitle');

    state.type = 'Agent';
    state.identifier = '1';
    await rerender();

    assert.dom().hasText('Agent 1 Title Subtitle');

    await render(
      <template>
        <Heading
          @title={{state.title}}
          @subtitle={{state.subtitle}}
          @type={{state.type}}
          @identifier={{state.identifier}}
        >
          template block text
        </Heading>
      </template>,
    );

    assert.dom().hasText('Agent 1 Title template block text Subtitle');
  });
});
