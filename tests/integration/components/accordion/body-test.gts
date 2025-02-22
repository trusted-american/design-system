import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { AccordionBody } from '@trusted-american/design-system';

module('Integration | Component | accordion/body', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <AccordionBody>
          template block text
        </AccordionBody>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
