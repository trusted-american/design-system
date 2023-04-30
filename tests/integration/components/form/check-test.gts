import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import FormCheck from '@trusted-american/design-system/components/form/check';

module('Integration | Component | form/check', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const value = false;
    const label = 'Label';
    const identifier = 'identifier';
    const inline = false;
    const _switch = false;
    const help = 'Help';
    // const helpTooltip = 'Help Tooltip';

    await render(<template>
      <FormCheck
        @value={{value}}
        @label={{label}}
        @identifier={{identifier}}
        @inline={{inline}}
        @switch={{_switch}}
        @help={{help}}
        {{!-- @helpTooltip={{helpTooltip}} --}}
      />
    </template>);

    assert.dom('label').hasText('Label');
    assert.dom('.form-text').hasText('Help');
  });
});
