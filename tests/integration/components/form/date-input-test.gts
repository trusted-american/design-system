import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, fillIn } from '@ember/test-helpers';
import FormDateInput from '@trusted-american/design-system/components/form/date-input';

module('Integration | Component | form/date-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.expect(4);

    const value = new Date();
    const min = undefined;
    const max = undefined;
    const label = 'Label';
    const required = true;
    const identifier = 'identifier';
    const onChange = (value: Date | null) => {
      const date = new Date(2014, 8, 13);
      assert.strictEqual(value?.getTime(), date.getTime());
    };

    await render(<template>
      <FormDateInput
        @value={{value}}
        @min={{min}}
        @max={{max}}
        @label={{label}}
        @required={{required}}
        @identifier={{identifier}}
        @onChange={{onChange}}
      />
    </template>);

    assert.dom('label').hasText('Label *');
    assert.dom('input').hasAttribute('type', 'date');
    assert.dom('input').hasAttribute('id', identifier);

    await fillIn('input', '2014-09-13');
  });
});
