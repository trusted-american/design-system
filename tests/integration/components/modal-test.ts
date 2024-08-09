import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { ModalSignature } from '@trusted-american/design-system/components/modal';

type Context = ModalSignature['Args'] & TestContext;

module('Integration | Component | modal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.onClose = () => {};

    await render<Context>(hbs`
      <Modal @title='Title' @onClose={{this.onClose}}>
        template block text
      </Modal>
    `);

    assert.dom().hasText('Title template block text');
  });
});
