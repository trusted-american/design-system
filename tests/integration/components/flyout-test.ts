import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | flyout', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Flyout
        @title="Title"
        @onClose={{(noop)}}
      >
        Body
      </Flyout>
    `);

    assert.dom().hasText('Title Body');
  });
});
