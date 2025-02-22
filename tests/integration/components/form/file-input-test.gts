import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormFileInput } from '@trusted-american/design-system';

module('Integration | Component | form/file-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const onChange = () => {
      assert.true(true);
    };

    await render(
      <template>
        <FormFileInput
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidFeedback="Invalid feedback"
          @onChange={{onChange}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('input').hasAttribute('id', 'identifier');
    assert.dom('input').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();
  });
});
