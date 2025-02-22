import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/radio/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template>
      <Form::Radio::Input
        @checked={{true}}
        @name="name"
        @identifier="identifier"
        @isRequired={{true}}
      />
    </template>);

    assert.dom().hasText('');
  });
});
