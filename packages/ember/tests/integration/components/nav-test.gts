import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import Nav from '@trusted-american/ember/components/nav';
import { Badge } from '@trusted-american/ember';
import { faHouse } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | nav', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Nav as |nav|>
          <nav.item
            @route="components"
            @label="First"
            @icon={{faHouse}}
            @count={{12}}
          />
          <nav.item @route="index" @label="Second" />
          <nav.item @route="index" @label="Third" />
          <nav.item @route="index" @label="Custom">
            <Badge @label="New" />
          </nav.item>
        </Nav>
      </template>,
    );

    assert.dom().hasText('First 12 Second Third Custom New');
  });
});
