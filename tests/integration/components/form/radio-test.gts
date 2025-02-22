import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormRadio } from '@trusted-american/design-system';

module('Integration | Component | form/radio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const options = [
      { value: 'one', label: 'One' },
      { value: 'two', label: 'Two' },
    ];
    this.selected = undefined;
    const onChange = (selected) => {
      this.selected = selected;
      assert.ok(selected);
    };

    await render(
      <template>
        <FormRadio
          @options={{options}}
          @selected={{this.selected}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{undefined}}
          @isInline={{undefined}}
          @onChange={{onChange}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('.form-check').hasText('One');
    assert.dom('.form-check:last-child').hasText('Two');
  });
});
