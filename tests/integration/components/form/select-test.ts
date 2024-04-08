import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, select, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormSelectSignature } from '@trusted-american/design-system/components/form/select';

type Context = FormSelectSignature<string>['Args'] & TestContext;

module('Integration | Component | form/select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render<Context>(hbs`
      <Form::Select
        @options={{array
          (hash value='a' label='A')
          (hash value='b' label='B')
          (hash value='c' label='C')
        }}
        @selected={{this.selected}}
        @label='Label'
        @identifier='identifier'
        @required={{true}}
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom('label').exists();
    assert.dom('label').hasText('Label *');

    await select('select', '2');

    assert.strictEqual(this.selected, 'c');
  });

  test('simple works', async function (this: Context, assert) {
    await render<Context>(hbs`
      <Form::Select
        @options={{array 'A' 'B' 'C'}}
        @selected={{this.selected}}
        @label='Label'
        @identifier='identifier'
        @required={{true}}
        @simple={{true}}
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom('label').exists();
    assert.dom('label').hasText('Label *');

    await select('select', 'C');

    assert.strictEqual(this.selected, 'C');
  });
});
