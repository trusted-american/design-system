import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render, waitFor } from '@ember/test-helpers';
import Toast from '@trusted-american/ember/components/toast';

module('Integration | Component | toast', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const onClose = () => {
      assert.ok(true);
    };

    await render(
      <template>
        <Toast @closeButtonLabel="Close" @onClose={{onClose}}>
          <:title>Title</:title>
          <:body>Body</:body>
        </Toast>
      </template>,
    );

    assert.dom('[data-test-toast]').hasClass('show');
    assert.dom('.toast-header').hasText('Title');
    assert.dom('.toast-body').hasText('Body');
    assert.dom('button').exists();
    await click('button');
    await waitFor('.hide');
    assert.dom('[data-test-toast]').hasClass('hide');
  });
});
