import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | icon', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`<Icon @icon="book" />`);

    assert.dom('svg').exists();

    await render(
      hbs`<Icon @icon="book" @color="danger" @isFixedWidth={{true}} @size="lg"/>`,
    );

    assert.dom('svg').exists();
  });
});
