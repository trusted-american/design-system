import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/time-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      hbs`{{! @glint-nocheck }}<Form::TimeInput @value={{null}} @label="Label" @identifier='' @onChange={{fn (mut this.value)}} />`
    );

    assert.dom().hasText('Label');
  });
});
