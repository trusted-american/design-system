import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import FormInput from '@trusted-american/design-system/components/form/input';

module('Integration | Component | form/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const value = 'Value';
    const type = 'text';
    const label = 'Label';
    const help = 'Provide any value you would like.';
    const invalidFeedback = 'Please provide a value.';
    const identifier = 'identifier';
    const required = true;

    await render(<template>
      <FormInput
        @value={{value}}
        @type={{type}}
        @label={{label}}
        @help={{help}}
        @invalidFeedback={{invalidFeedback}}
        @identifier={{identifier}}
        @required={{required}}
      />
    </template>);

    assert.dom('label').hasText('Label *');
    assert.dom('input').exists();
    assert.dom('.invalid-feedback').hasText('Please provide a value.');
    assert.dom('.form-text').hasText('Provide any value you would like.');
  });
});
