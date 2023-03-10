import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | modal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Modal @title="Title" @onClose={{fn (mut this.xyz)}}>
        template block text
      </Modal>
    `);

    assert.dom().hasText('template block text');
  });
});
