import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { fromNow } from '@trusted-american/ember';

module('Integration | Helper | from-now', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    await render(<template>{{fromNow date}}</template>);

    assert.dom().hasText('a year ago');
  });

  test('short works', async function (assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    await render(<template>{{fromNow date isCompact=true}}</template>);

    assert.dom().hasText('1Y');
  });

  test('object reference quirks are compensated for', async function (assert) {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 1);

    await render(
      <template>
        {{fromNow date isCompact=true}}
        {{fromNow date}}
        {{fromNow date isCompact=true}}
      </template>,
    );

    assert.dom().hasText('1Y a year ago 1Y');
  });
});
