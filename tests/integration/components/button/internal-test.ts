import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | button/internal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Button::Internal
        @text=""
        @icon="check"
        @isIconTrailing={{false}}
        @isIconOnly={{false}}
        @isLoading={{false}}
      />
    `);

    assert.dom().hasText('');
  });
});
