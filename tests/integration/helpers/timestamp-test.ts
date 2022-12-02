import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

interface Context extends TestContext {
  date?: Date;
  format?: 'date' | 'time';
  number?: boolean;
  year?: boolean;
  utc?: boolean;
}

module('Integration | Helper | timestamp', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    await render(
      hbs`{{timestamp this.date this.format number=this.number year=this.year utc=this.utc}}`
    );
    assert.dom(this.element as Element).hasText('');

    this.set('date', new Date(2022, 0, 1));
    assert.dom(this.element as Element).hasText('Jan 1, 2022 at 12:00 AM');

    this.set('format', 'date');
    assert.dom(this.element as Element).hasText('Jan 1, 2022');

    this.set('format', 'time');
    assert.dom(this.element as Element).hasText('12:00 AM');

    this.set('format', undefined);
    this.set('number', true);
    assert.dom(this.element as Element).hasText('01/01/2022');

    this.set('number', undefined);
    this.set('year', true);
    assert.dom(this.element as Element).hasText('2022');

    // TODO: doesn't work in ci
    // this.set('year', undefined);
    // this.set('utc', true);
    // assert.dom(this.element as Element).hasText('Jan 1, 2022 at 8:00 AM');
  });
});
