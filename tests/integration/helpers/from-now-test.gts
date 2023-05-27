import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import fromNow from '@trusted-american/design-system/helpers/from-now';
import { tracked } from 'tracked-built-ins';

module('Integration | Helper | from-now', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    const state = tracked({
      inputValue: date,
    });

    await render(<template>{{fromNow state.inputValue}}</template>);

    assert.dom().hasText('a year ago');
  });

  test('short works', async function (assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    const state = tracked({
      inputValue: date,
    });

    await render(<template>{{fromNow state.inputValue short=true}}</template>);

    assert.dom().hasText('1Y ago');
  });

  test('object reference quirks are compensated for', async function (assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    const state = tracked({
      inputValue: date,
    });

    await render(<template>
      {{fromNow state.inputValue short=true}}
      {{fromNow state.inputValue}}
      {{fromNow state.inputValue short=true}}
    </template>);

    assert.dom().hasText('1Y ago a year ago 1Y ago');
  });
});
