import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Badge } from '@trusted-american/design-system';

module('Integration | Component | badge', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><Badge @label="Test1" /></template>);
    assert.dom().hasText('Test1');
    assert.dom('svg').doesNotExist();
    assert.dom('span div').doesNotExist();

    await render(
      <template>
        <Badge @label="Test2" @icon="check" @isLoading={{true}} />
      </template>,
    );
    assert.dom('span div').exists();
    assert.dom('svg').exists();
    assert.dom().hasText('Test2');
  });
});
