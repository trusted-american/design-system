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
          (hash value="a" label="A")
          (hash value="b" label="B")
          (hash value="c" label="C")
        }}
        @selected={{this.selected}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @help="Help"
        @invalidFeedback="Invalid feedback"
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom('[data-test-form-label]').exists();
    assert.dom('select').hasAttribute('id', 'identifier');
    assert.dom('select').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();

    await select('[data-test-form-select]', '2');

    assert.strictEqual(this.selected, 'c');
  });

  test('it works with heterogeneous options', async function (this: Context, assert) {
    await render<Context>(hbs`
      <Form::Select
        @options={{array
          "a"
          (hash value="b" label="B")
          (hash groupLabel="Label" options=(array (hash value="c" label="C")))
        }}
        @selected={{this.selected}}
        @label="Label"
        @identifier="identifier"
        @isRequired={{true}}
        @chooseText="Choose…"
        @onChange={{fn (mut this.selected)}}
      />
    `);

    await select('[data-test-form-select]', '0');

    assert.strictEqual(this.selected, 'a');

    await select('[data-test-form-select]', '1');

    assert.strictEqual(this.selected, 'b');

    await select('[data-test-form-select]', '2-0');

    assert.strictEqual(this.selected, 'c');
  });
});
