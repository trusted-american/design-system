import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import fromNow from '@trusted-american/design-system/helpers/from-now';

interface Context extends TestContext {
  element: Element;

  inputValue: Date;
}

module('Integration | Helper | from-now', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    this.inputValue = date;

    await render<Context>(<template>{{fromNow this.inputValue}}</template>);

    assert.dom().hasText('a year ago');
  });

  test('short works', async function (this: Context, assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    this.inputValue = date;

    await render<Context>(<template>
      {{fromNow this.inputValue short=true}}
    </template>);

    assert.dom().hasText('1Y ago');
  });

  test('object reference quirks are compensated for', async function (this: Context, assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    this.inputValue = date;

    await render<Context>(<template>
      {{fromNow this.inputValue short=true}}
      {{fromNow this.inputValue}}
      {{fromNow this.inputValue short=true}}
    </template>);

    assert.dom().hasText('1Y ago a year ago 1Y ago');
  });
});
