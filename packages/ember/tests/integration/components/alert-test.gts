import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Alert } from '@trusted-american/design-system';
import { faHouse } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | alert', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Alert>
          <:title>Title here</:title>
          <:default>Body here</:default>
        </Alert>
      </template>,
    );

    assert.dom().hasText('Title here Body here');

    await render(
      <template>
        <Alert @icon={{faHouse}} @color="danger">
          <:title>Title here</:title>
          <:default>Body here</:default>
        </Alert>
      </template>,
    );

    assert.dom('[data-test-icon]').exists();
  });

  test('it supports close button', async function (assert) {
    const onClose = () => {
      assert.ok(true);
    };

    await render(
      <template>
        <Alert @closeButtonLabel="Close" @onClose={{onClose}}>
          <:title>Title here</:title>
          <:default>Body here</:default>
        </Alert>
      </template>,
    );

    assert.dom().hasText('Title here Body here');
    assert.dom('[data-test-close-button]').exists();
  });
});
