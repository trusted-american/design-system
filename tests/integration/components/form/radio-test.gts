import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormRadio from '@trusted-american/design-system/components/form/radio';

module('Integration | Component | form/radio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.expect(3);

    const options = [
      { value: 'one', label: 'One' },
      { value: 'two', label: 'Two' },
    ];
    const selected = undefined;
    const label = 'Label';
    const identifier = 'identifier';
    const required = undefined;
    const inline = undefined;
    const onChange = (selected: unknown) => {
      assert.ok(selected);
    };

    await render(<template>
      <FormRadio
        @options={{options}}
        @selected={{selected}}
        @label={{label}}
        @identifier={{identifier}}
        @required={{required}}
        @inline={{inline}}
        @onChange={{onChange}}
      />
    </template>);

    assert.dom('label').hasText('Label');
    assert.dom('.form-check').hasText('One');
    assert.dom('.form-check:last-child').hasText('Two');
  });
});
