import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import Calendar from '@trusted-american/ember/components/calendar';

module('Integration | Component | calendar', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const events = [
      { title: 'Test1', start: new Date() },
      { title: 'Test2', start: new Date() },
    ];

    await render(<template><Calendar @events={{events}} /></template>);

    assert.dom('.fc').exists();
    assert.dom('.fc-daygrid').exists();
    assert.dom().containsText('Test1');
    assert.dom().containsText('Test2');

    assert
      .dom('.fc-header-toolbar div:nth-of-type(3) button:nth-of-type(1)')
      .hasText('Month');
    assert
      .dom('.fc-header-toolbar div:nth-of-type(3) button:nth-of-type(2)')
      .hasText('Week');
    assert
      .dom('.fc-header-toolbar div:nth-of-type(3) button:nth-of-type(3)')
      .hasText('Day');
    assert
      .dom('.fc-header-toolbar div:nth-of-type(3) button:nth-of-type(4)')
      .hasText('List');

    await click('.fc-header-toolbar div:nth-of-type(3) button:nth-of-type(2)');
    assert.dom().containsText('Test1');
    assert.dom().containsText('Test2');

    await click('.fc-header-toolbar div:nth-of-type(3) button:nth-of-type(3)');
    assert.dom().containsText('Test1');
    assert.dom().containsText('Test2');

    await click('.fc-header-toolbar div:nth-of-type(3) button:nth-of-type(4)');
    assert.dom().containsText('Test1');
    assert.dom().containsText('Test2');
  });
});
