import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | pagination/item', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template><Pagination::Item @index={{0}} @page={{0}} @onClick={{(noop)}}/>`,
    );

    assert.dom().hasText('1');
  });
});
