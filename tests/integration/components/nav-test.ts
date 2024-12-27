import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | nav', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Nav>
        <Nav::Item @route="comps" @text="First" @icon="house" @count={{12}} />
        <Nav::Item @route="index" @text="Second" />
        <Nav::Item @route="index" @text="Third" />
        <Nav::Item @route="index" @text="Custom">
          <Badge @text="New" />
        </Nav::Item>
      </Nav>
    `);

    assert.dom().hasText('First 12 Second Third Custom New');
  });
});
