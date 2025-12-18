import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Accordion } from '@trusted-american/ember';

module('Integration | Component | accordion', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Accordion as |accordion|>
          <accordion.item as |item|>
            <item.button>Accordion Item #1</item.button>
            <item.body>First</item.body>
          </accordion.item>
          <accordion.item as |item|>
            <item.button>Accordion Item #2</item.button>
            <item.body>Second</item.body>
          </accordion.item>
          <accordion.item as |item|>
            <item.button>Accordion Item #3</item.button>
            <item.body>Third</item.body>
          </accordion.item>
        </Accordion>
      </template>,
    );

    assert
      .dom()
      .hasText(
        'Accordion Item #1 First Accordion Item #2 Second Accordion Item #3 Third',
      );
  });
});
