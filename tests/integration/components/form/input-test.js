import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

// interface Context extends TestContext {
//   value: string;
//   type: string;
//   label: string;
//   help: string;
//   invalidFeedback: string;
//   identifier: string;
//   required: boolean;
// }

module('Integration | Component | form/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    this.value = 'Value';
    this.type = 'text';
    this.label = 'Label';
    this.help = 'Provide any value you would like.';
    this.invalidFeedback = 'Please provide a value.';
    this.identifier = 'identifier';
    this.required = true;

    await render(hbs`
      <Form::Input
        @value={{this.value}}
        @type={{this.type}}
        @label={{this.label}}
        @help={{this.help}}
        @invalidFeedback={{this.invalidFeedback}}
        @identifier={{this.identifier}}
        @required={{this.required}}
      />
    `);

    assert
      .dom(this.element)
      .hasText(
        'Label * Please provide a value. Provide any value you would like.'
      );
  });
});
