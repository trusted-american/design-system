import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | button/internal', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template>
      <Button::Internal
        @label=""
        @icon="check"
        @isIconTrailing={{false}}
        @isIconOnly={{false}}
        @isLoading={{false}}
      />
    </template>);

    assert.dom().hasText('');
  });
});
