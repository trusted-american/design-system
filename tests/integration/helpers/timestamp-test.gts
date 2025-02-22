import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { timestamp } from '@trusted-american/design-system';

module('Integration | Helper | timestamp', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const date = new Date(2022, 0, 1);

    await render(<template>{{timestamp date}}</template>);

    assert.dom().hasText('Jan 1, 2022 at 12:00 AM');
  });

  test('it renders date format', async function (assert) {
    const date = new Date(2022, 0, 1);

    await render(<template>{{timestamp date format="date"}}</template>);

    assert.dom().hasText('Jan 1, 2022');
  });

  test('it renders time format', async function (assert) {
    const date = new Date(2022, 0, 1);

    await render(<template>{{timestamp date format="time"}}</template>);

    assert.dom().hasText('12:00 AM');
  });

  test('it renders numberDate format', async function (assert) {
    const date = new Date(2022, 0, 1);

    await render(<template>{{timestamp date format="numberDate"}}</template>);

    assert.dom().hasText('01/01/2022');
  });

  test('it renders year format', async function (assert) {
    const date = new Date(2022, 0, 1);

    await render(<template>{{timestamp date format="year"}}</template>);

    assert.dom().hasText('2022');
  });

  test('it renders full format', async function (assert) {
    const date = new Date(2022, 0, 1);

    await render(<template>{{timestamp date format="full"}}</template>);

    assert.dom().hasText('Jan 1, 2022 at 12:00 AM');
  });

  test('it renders relative time', async function (assert) {
    const date = new Date();

    await render(<template>{{timestamp date}}</template>);

    assert.dom().includesText('Today');

    const _date = new Date();
    _date.setDate(_date.getDate() - 1);
    this.set('date', _date);

    assert.dom().includesText('Yesterday');

    const date1 = new Date();
    date1.setDate(date1.getDate() + 1);
    this.set('date', date1);

    assert.dom().includesText('Tomorrow');
  });

  test('it renders utc', async function (assert) {
    const date = new Date(Date.UTC(2022, 0, 1));

    await render(<template>{{timestamp date utc=true}}</template>);

    assert.dom().hasText('Jan 1, 2022 at 12:00 AM');
  });
});
