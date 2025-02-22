import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import ButtonInternal from '@trusted-american/design-system/components/button/internal';

module('Integration | Component | button/internal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ButtonInternal
          @label=""
          @icon="check"
          @isIconTrailing={{false}}
          @isIconOnly={{false}}
          @isLoading={{false}}
        />
      </template>,
    );

    assert.dom().hasText('');
  });
});
