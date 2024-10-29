import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render, select, type TestContext } from '@ember/test-helpers';
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
        @isRequired={{true}}
        @help='Help'
        @invalidFeedback='Invalid feedback'
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom('[data-test-form-label]').exists();
    assert.dom('select').hasAttribute('id', 'identifier');
    assert.dom('select').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();

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
        @isRequired={{true}}
        @isSimple={{true}}
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom('[data-test-form-label]').exists();

    await select('select', 'C');

    assert.strictEqual(this.selected, 'C');
  });

  test('grouped works', async function (this: Context, assert) {
    await render<Context>(hbs`
      <Form::Select 
        @options={{(array
          (hash groupName="First" options=(array
            (hash value="A" label="A")
            (hash value="B" label="B")
            (hash value="C" label="C")
          ))
          (hash label="D" value="D")
        )
        }} 
        @selected={{this.selected}}
        @label='Label'
        @identifier='group'
        @isRequired={{true}} 
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom('select optgroup').hasAttribute('label', 'First');
    assert.dom('select optgroup option').exists();
    assert.dom('#group option:nth-child(3)').exists();

    assert.strictEqual(this.selected, 'A');
    await click('#group');
    await select('#group', '0-1');
    assert.strictEqual(this.selected, 'B');

    await select('#group', '1');
    assert.strictEqual(this.selected, 'D');
  });
});
