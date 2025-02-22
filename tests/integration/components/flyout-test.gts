import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Flyout } from '@trusted-american/design-system';

module('Integration | Component | flyout', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const onClose = () => {};

    await render(
      <template>
        <Flyout @title="Title" @closeButtonLabel="Close" @onClose={{onClose}}>
          Body
        </Flyout>
      </template>,
    );

    assert.dom().hasText('Title Body');
  });
});
