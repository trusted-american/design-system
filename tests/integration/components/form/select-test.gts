import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, select } from '@ember/test-helpers';
import FormSelect from '@trusted-american/design-system/components/form/select';
import { fn, array } from '@ember/helper';

module('Integration | Component | form/select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const options = [
      {
        label: 'A',
        value: 'a',
      },
      {
        label: 'B',
        value: 'b',
      },
      {
        label: 'C',
        value: 'c',
      },
    ];
    let selected: unknown = undefined;
    const label = 'Label';
    const identifier = 'identifier';
    const onChange = (value: unknown) => {
      selected = value;
    };

    await render(<template>
      <FormSelect
        @options={{options}}
        @selected={{selected}}
        @label={{label}}
        @identifier={{identifier}}
        @onChange={{onChange}}
      />
    </template>);

    assert.dom('label').exists();
    assert.dom('label').hasText('Label');

    await select('select', '2');

    assert.strictEqual(selected, 'c');
  });

  test('simple works', async function (assert) {
    // const options = ['A', 'B', 'C'];
    let selected: unknown = undefined;
    const label = 'Label';
    const identifier = 'identifier';
    const required = true;
    // const simple = true;
    const onChange = (value: unknown) => {
      selected = value;
    };

    await render(<template>
      <FormSelect
        @options={{array 'A' 'B' 'C'}}
        @selected={{selected}}
        @label={{label}}
        @identifier={{identifier}}
        @required={{required}}
        @simple={{true}}
        @onChange={{onChange}}
      />
    </template>);

    assert.dom('label').exists();
    assert.dom('label').hasText('Label *');

    await select('select', 'C');

    assert.strictEqual(selected, 'C');
  });
});
