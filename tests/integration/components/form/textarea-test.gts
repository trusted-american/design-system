import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormTextarea from '@trusted-american/design-system/components/form/textarea';

module('Integration | Component | form/textarea', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const value = 'Value';
    const label = 'Label';
    const identifier = 'identifier';
    const required = true;

    await render(<template>
      <FormTextarea
        @value={{value}}
        @label={{label}}
        @identifier={{identifier}}
        @required={{required}}
      />
    </template>);

    assert.dom('label').hasText('Label *');
  });
});
