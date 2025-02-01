import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | property-list/item/key', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`<PropertyList::Item::Key @label="Label" @help="Help" />`);

    assert.dom('dt').hasText('Label Help');
  });
});
