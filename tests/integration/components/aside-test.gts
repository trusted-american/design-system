import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import { Aside } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | aside', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked({ isCollapsed: false });

    await render(
      <template>
        <Aside
          @title="Title"
          @logo=""
          @route=""
          @isCollapsed={{state.isCollapsed}}
          @collapseLabel="Collapse menu"
          @onChange={{fn (mut state.isCollapsed)}}
        >
          <:default>
            Default
          </:default>
          <:footer>
            Bottom
          </:footer>
        </Aside>
      </template>,
    );

    assert.dom('aside').hasText('Title Default Bottom');

    assert.dom('aside').doesNotHaveClass('collapsed');

    await click('button');

    assert.dom('aside').hasClass('collapsed');
  });
});
