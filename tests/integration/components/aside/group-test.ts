import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | aside/group', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Aside::Group @label="Label" @icon="boxes-stacked" @route="index">
        template block text
      </Aside::Group>
    `);

    assert.dom().hasText('Label template block text');
  });
});
