import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, select, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormSelectComponentSignature } from '@trusted-american/design-system/components/form/select';

type Context = FormSelectComponentSignature['Args'] & TestContext;

module('Integration | Component | form/select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.options = [
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
    this.selected = undefined;
    this.label = 'Label';
    this.identifier = 'identifier';

    await render<Context>(hbs`
      {{! @glint-ignore }}
      <Form::Select
        @options={{this.options}}
        @selected={{this.selected}}
        @label={{this.label}}
        @identifier={{this.identifier}}
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom('label').exists();
    assert.dom('label').hasText('Label');

    await select('select', '2');

    assert.strictEqual(this.selected, 'c');
  });

  test('simple works', async function (this: Context, assert) {
    this.options = ['A', 'B', 'C'];
    this.selected = undefined;
    this.label = 'Label';
    this.identifier = 'identifier';
    this.required = true;
    this.simple = true;

    await render<Context>(hbs`
      {{! @glint-ignore }}
      <Form::Select
        @options={{this.options}}
        @selected={{this.selected}}
        @label={{this.label}}
        @identifier={{this.identifier}}
        @required={{this.required}}
        @simple={{this.simple}}
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom('label').exists();
    assert.dom('label').hasText('Label *');

    await select('select', 'C');

    assert.strictEqual(this.selected, 'C');
  });
});
