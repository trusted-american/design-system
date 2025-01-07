import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

interface Context extends TestContext {
  date?: Date;
}

module('Integration | Helper | timestamp', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.set('date', new Date(2022, 0, 1));

    await render<Context>(hbs`{{timestamp this.date}}`);

    assert.dom().hasText('Jan 1, 2022 at 12:00 AM');
  });

  test('it renders date format', async function (this: Context, assert) {
    this.set('date', new Date(2022, 0, 1));

    await render<Context>(hbs`{{timestamp this.date format='date'}}`);

    assert.dom().hasText('Jan 1, 2022');
  });

  test('it renders time format', async function (this: Context, assert) {
    this.set('date', new Date(2022, 0, 1));

    await render<Context>(hbs`{{timestamp this.date format='time'}}`);

    assert.dom().hasText('12:00 AM');
  });

  test('it renders number format', async function (this: Context, assert) {
    this.set('date', new Date(2022, 0, 1));

    await render<Context>(hbs`{{timestamp this.date number=true}}`);

    assert.dom().hasText('01/01/2022');
  });

  test('it renders year format', async function (this: Context, assert) {
    this.set('date', new Date(2022, 0, 1));

    await render<Context>(hbs`{{timestamp this.date year=true}}`);

    assert.dom().hasText('2022');
  });

  test('it renders relative time', async function (this: Context, assert) {
    this.set('date', new Date());

    await render<Context>(hbs`{{timestamp this.date}}`);

    assert.dom().includesText('Today');

    const date = new Date();
    date.setDate(date.getDate() - 1);
    this.set('date', date);

    assert.dom().includesText('Yesterday');

    const date1 = new Date();
    date1.setDate(date1.getDate() + 1);
    this.set('date', date1);

    assert.dom().includesText('Tomorrow');
  });

  test('it renders utc', async function (this: Context, assert) {
    this.set('date', new Date(Date.UTC(2022, 0, 1)));

    await render<Context>(hbs`{{timestamp this.date utc=true}}`);

    assert.dom().hasText('Jan 1, 2022 at 12:00 AM');
  });
});
