import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Badge } from '@trusted-american/design-system';

module('Integration | Component | badge', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><Badge @label="Label" /></template>);

    assert.dom('[data-test-badge]').hasText('Label');
    assert.dom('[data-test-badge] div').doesNotExist();
    assert.dom('[data-test-badge] [data-test-icon]').doesNotExist();

    await render(
      <template>
        <Badge @label="Label" @icon="check" @isLoading={{true}} />
      </template>,
    );
    assert.dom('[data-test-badge] div').exists();
    assert.dom('[data-test-badge] [data-test-icon]').exists();
  });
});
