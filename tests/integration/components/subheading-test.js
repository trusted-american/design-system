import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | subheading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    this.title = 'Title';

    await render(hbs`<Subheading @title={{this.title}} />`);

    assert.dom(this.element).hasText('Title');

    await render(hbs`
      <Subheading @title={{this.title}}>
        template block text
      </Subheading>
    `);

    assert.dom(this.element).hasText('Title template block text');
  });
});
