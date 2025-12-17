import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { Modal } from '@trusted-american/design-system';

module('Integration | Component | modal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const onClose = () => {
      // assert.true(true);
    };

    await render(
      <template>
        <Modal @title="Title" @closeButtonLabel="Close" @onClose={{onClose}}>
          template block text
        </Modal>
      </template>,
    );

    assert.dom('[data-test-modal]').exists();
    assert.dom().hasText('Title template block text');
    assert.dom('[data-test-close-button]').exists();

    // removing Backdrop so button is clickable
    const backdrop = document.getElementsByClassName(
      'modal-backdrop fade show',
    );
    backdrop[0]?.remove();

    await click('[data-test-close-button]');
  });
});
