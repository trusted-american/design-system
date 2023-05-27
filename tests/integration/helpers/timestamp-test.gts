import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, rerender } from '@ember/test-helpers';
import timestamp from '@trusted-american/design-system/helpers/timestamp';
import { tracked } from 'tracked-built-ins';

module('Integration | Helper | timestamp', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked<{
      date?: Date;
      format?: 'date' | 'time';
      number?: boolean;
      year?: boolean;
      utc?: boolean;
    }>({});

    await render(<template>
      {{timestamp
        state.date
        format=state.format
        number=state.number
        year=state.year
        utc=state.utc
      }}
    </template>);
    assert.dom().hasText('');

    state.date = new Date(2022, 0, 1);
    await rerender();

    assert.dom().hasText('Jan 1, 2022 at 12:00 AM');

    state.format = 'date';
    await rerender();

    assert.dom().hasText('Jan 1, 2022');

    state.format = 'time';
    await rerender();

    assert.dom().hasText('12:00 AM');

    state.format = undefined;
    state.number = true;
    await rerender();

    assert.dom().hasText('01/01/2022');

    state.number = undefined;
    state.year = true;
    await rerender();

    assert.dom().hasText('2022');

    state.date = new Date();
    state.year = undefined;
    await rerender();

    assert.dom().includesText('Today');

    const date = new Date();
    date.setDate(date.getDate() - 1);
    state.date = date;
    await rerender();

    assert.dom().includesText('Yesterday');

    const date1 = new Date();
    date1.setDate(date1.getDate() + 1);
    state.date = date1;

    assert.dom().includesText('Tomorrow');

    // TODO: doesn't work in ci
    // this.set('year', undefined);
    // this.set('utc', true);
    // assert.dom().hasText('Jan 1, 2022 at 8:00 AM');
  });
});
