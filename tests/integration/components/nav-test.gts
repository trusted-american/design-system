import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Badge, Nav, NavItem } from '@trusted-american/design-system';

module('Integration | Component | nav', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Nav>
          <NavItem @route="comps" @label="First" @icon="house" @count={{12}} />
          <NavItem @route="index" @label="Second" />
          <NavItem @route="index" @label="Third" />
          <NavItem @route="index" @label="Custom">
            <Badge @label="New" />
          </NavItem>
        </Nav>
      </template>,
    );

    assert.dom().hasText('First 12 Second Third Custom New');
  });
});
