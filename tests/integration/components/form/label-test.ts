import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/label', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Form::Label
        @text='Text'
        @identifier='identifier'
        @isRequired={{true}}
      />
    `);

    assert.dom('label').exists();
    assert.dom('label').hasText('Text *');
  });
});
