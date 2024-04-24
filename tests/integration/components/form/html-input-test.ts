import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/html-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Form::HtmlInput
        @value='value'
        @label='Label'
        @identifier='identifier'
        @required={{true}}
        @onChange={{(noop)}}
      />
    `);

    assert.dom().includesText('Label *');
    assert.dom().includesText('Please provide a value.');

    assert.dom('[data-test-value-editor]').exists();
    assert.dom('[data-test-value-code]').doesNotExist();

    await click('[data-test-code]');

    assert.dom('[data-test-value-editor]').doesNotExist();
    assert.dom('[data-test-value-code]').exists();
  });
});
