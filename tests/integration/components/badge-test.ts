import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | badge', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`<Badge @text='Test1' />`);
    assert.dom().hasText('Test1');
    assert.dom('svg').doesNotExist();
    assert.dom('span div').doesNotExist();

    await render(hbs`<Badge @text='Test2' @icon="check" @isLoading={{true}}/>`);
    assert.dom('span div').exists();
    assert.dom('svg').exists();
    assert.dom().hasText('Test2');
  });
});
