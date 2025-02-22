import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { Calendar } from '@trusted-american/design-system';

import type { CalendarSignature } from '@trusted-american/design-system/components/calendar';

type Context = CalendarSignature['Args'] & TestContext;

module('Integration | Component | calendar', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.events = [
      { title: 'Test1', start: new Date() },
      { title: 'Test2', start: new Date() },
    ];

    await render<Context>(
      <template><Calendar @events={{this.events}} /></template>,
    );
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
