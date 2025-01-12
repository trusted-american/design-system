import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, find } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | progress', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`<Progress as |progress|>
      <progress.bar @value={{0.3}} @color="danger" />
      <progress.bar @value={{0.3}} @color="warning" />
      <progress.bar @value={{0.3}} @color="success" />
    </Progress>`);

    const element1 = find('.bg-danger');
    assert.ok(element1, '.bg-danger exists');
    const width1 = element1
      ? window.getComputedStyle(element1).width
      : 'error1';

    const element2 = find('.bg-warning');
    assert.ok(element2, '.bg-warning exists');
    const width2 = element2
      ? window.getComputedStyle(element2).width
      : 'error2';

    const element3 = find('.bg-success');
    assert.ok(element3, '.bg-success exists');
    const width3 = element3
      ? window.getComputedStyle(element3).width
      : 'error3';

    assert.deepEqual(width1, width2);
    assert.deepEqual(width2, width3);
    assert.deepEqual(width3, width1);
  });
});
