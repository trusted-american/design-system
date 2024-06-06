import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/check/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Form::Check::Input
        @value={{false}}
        @label='Label'
        @identifier='identifier'
        @isRequired={{true}}
      />
    `);

    assert.dom().hasText('');
  });
});
