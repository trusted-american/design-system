import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Icon } from '@trusted-american/design-system';

module('Integration | Component | icon', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><Icon @icon="book" /></template>);

    assert.dom('svg').exists();

    await render(
      <template>
        <Icon @icon="book" @color="danger" @isFixedWidth={{true}} @size="lg" />
      </template>,
    );

    assert.dom('svg').exists();
  });
});
