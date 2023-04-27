import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

interface Context extends TestContext {
  element: Element;

  date?: Date;
  format?: 'date' | 'time';
  number?: boolean;
  year?: boolean;
  utc?: boolean;
}

module('Integration | Helper | timestamp', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render<Context>(
      hbs`{{timestamp this.date format=this.format number=this.number year=this.year utc=this.utc}}`
    );
    assert.dom(this.element).hasText('');

    this.set('date', new Date(2022, 0, 1));
    assert.dom(this.element).hasText('Jan 1, 2022 at 12:00 AM');

    this.set('format', 'date');
    assert.dom(this.element).hasText('Jan 1, 2022');

    this.set('format', 'time');
    assert.dom(this.element).hasText('12:00 AM');

    this.set('format', undefined);
    this.set('number', true);
    assert.dom(this.element).hasText('01/01/2022');

    this.set('number', undefined);
    this.set('year', true);
    assert.dom(this.element).hasText('2022');

    this.set('date', new Date());
    this.set('year', undefined);
    assert.dom(this.element).includesText('Today');

    const date = new Date();
    date.setDate(date.getDate() - 1);
    this.set('date', date);
    assert.dom(this.element).includesText('Yesterday');

    const date1 = new Date();
    date1.setDate(date1.getDate() + 1);
    this.set('date', date1);
    assert.dom(this.element).includesText('Tomorrow');

    // TODO: doesn't work in ci
    // this.set('year', undefined);
    // this.set('utc', true);
    // assert.dom(this.element).hasText('Jan 1, 2022 at 8:00 AM');
  });
});
