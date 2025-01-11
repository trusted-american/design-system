import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { find, render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | ratio', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders 1 x 1', async function (assert) {
    await render(hbs`
      <Ratio @ratio='1x1'>
      </Ratio>
    `);

    const element = find('[data-test-ratio]');
    assert.ok(element, '.bg-danger exists');
    const width = element
      ? window.getComputedStyle(element).width
      : 'errorWidth';
    const height = element
      ? window.getComputedStyle(element).height
      : 'errorHeight';

    const numericWidth = Number(width.substring(0, width.length - 2));
    const numericHeight = Number(height.substring(0, height.length - 2));
    assert.deepEqual(numericWidth, numericHeight);
  });

  test('it renders 4 x 3', async function (assert) {
    await render(hbs`
      <Ratio @ratio='4x3'>
      </Ratio>
    `);

    const element = find('[data-test-ratio]');
    assert.ok(element, '.bg-danger exists');
    const width = element
      ? window.getComputedStyle(element).width
      : 'errorWidth';
    const height = element
      ? window.getComputedStyle(element).height
      : 'errorHeight';

    const numericWidth = Number(width.substring(0, width.length - 2));
    const numericHeight = Number(height.substring(0, height.length - 2));
    assert.deepEqual(numericWidth / numericHeight, 4 / 3);
  });

  test('it renders 16 x 9', async function (assert) {
    await render(hbs`
      <Ratio @ratio='16x9'>
      </Ratio>
    `);

    const element = find('[data-test-ratio]');
    assert.ok(element, '.bg-danger exists');
    const width = element
      ? window.getComputedStyle(element).width
      : 'errorWidth';
    const height = element
      ? window.getComputedStyle(element).height
      : 'errorHeight';

    const numericWidth = Number(width.substring(0, width.length - 2));
    const numericHeight = Number(height.substring(0, height.length - 2));
    assert.deepEqual(numericWidth / numericHeight, 16 / 9);
  });

  test('it renders 21 x 9', async function (assert) {
    await render(hbs`
      <Ratio @ratio='21x9'>
      </Ratio>
    `);

    const element = find('[data-test-ratio]');
    assert.ok(element, '.bg-danger exists');
    const width = element
      ? window.getComputedStyle(element).width
      : 'errorWidth';
    const height = element
      ? window.getComputedStyle(element).height
      : 'errorHeight';

    const numericWidth = Number(width.substring(0, width.length - 2));
    const numericHeight = Number(height.substring(0, height.length - 2));
    assert.deepEqual(numericWidth / numericHeight, 21 / 9);
  });
});
