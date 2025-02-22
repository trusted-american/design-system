import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { FormRadio } from '@trusted-american/design-system';

import type { FormRadioSignature } from '@trusted-american/design-system/components/form/radio';

type Context = FormRadioSignature<unknown>['Args'] & TestContext;

module('Integration | Component | form/radio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.options = [
      { value: 'one', label: 'One' },
      { value: 'two', label: 'Two' },
    ];
    this.selected = undefined;
    this.onChange = (selected) => {
      this.selected = selected;
      assert.ok(selected);
    };

    await render<Context>(
      <template>
        <FormRadio
          @options={{this.options}}
          @selected={{this.selected}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{undefined}}
          @isInline={{undefined}}
          @onChange={{this.onChange}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('.form-check').hasText('One');
    assert.dom('.form-check:last-child').hasText('Two');
  });
});
