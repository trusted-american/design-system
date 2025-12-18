import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Heading } from '@trusted-american/ember';
import { tracked } from '@glimmer/tracking';
import { rerender } from '@ember/test-helpers';

module('Integration | Component | heading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked title = 'Title';
      @tracked subtitle?: string;
      @tracked type?: string;
      @tracked identifier?: string;
    }
    const state = new State();

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
