import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { Modal } from '@trusted-american/design-system';

import type { ModalSignature } from '@trusted-american/design-system/components/modal';

type Context = ModalSignature['Args'] & TestContext;

module('Integration | Component | modal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.onClose = () => {
      // assert.true(true);
    };

    await render<Context>(
      <template>
        <Modal
          @title="Title"
          @closeButtonLabel="Close"
          @onClose={{this.onClose}}
        >
          template block text
        </Modal>
      </template>,
    );

    assert.dom('[data-test-modal]').exists();
    assert.dom().hasText('Title template block text');
    assert.dom('[data-test-close-button]').exists();

    //Removing Backdrop so button is clickable
    const backdrop = document.getElementsByClassName(
      'modal-backdrop fade show',
    );
    backdrop[0]?.remove();

    await click('[data-test-close-button]');
  });
});
