import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormFileInput from '@trusted-american/design-system/components/form/file-input';

module('Integration | Component | form/file-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.expect(2);

    const label = 'Label';
    const identifier = 'identifier';
    const required = true;
    const invalidFeedback = 'Please provide a file.';
    const onChange = () => {
      assert.true(true);
    };

    await render(<template>
      <FormFileInput
        @label={{label}}
        @identifier={{identifier}}
        @required={{required}}
        @invalidFeedback={{invalidFeedback}}
        @onChange={{onChange}}
      />
    </template>);

    assert.dom('label').hasText('Label *');
    assert.dom('.invalid-feedback').hasText('Please provide a file.');
  });
});
