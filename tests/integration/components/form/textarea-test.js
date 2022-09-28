import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

// interface Context extends TestContext {
//   value: unknown;
//   label?: string;
//   identifier: string;
//   required?: boolean;
// }

module('Integration | Component | form/textarea', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    this.value = 'Value';
    this.label = 'Label';
    this.identifier = 'identifier';
    this.required = true;

    await render(hbs`
      <Form::Textarea
        @value={{this.value}}
        @label={{this.label}}
        @identifier={{this.identifier}}
        @required={{this.required}}
      />
    `);

    assert.dom(this.element).hasText('Label *');

    this.set('required', false);

    assert.dom(this.element).hasText('Label');
  });
});
