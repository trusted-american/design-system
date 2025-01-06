import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Helper | theme', function (hooks) {
  setupRenderingTest(hooks);

  hooks.beforeEach(function () {
    localStorage.removeItem('isDarkMode');
  });

  test('it renders dark', async function (assert) {
    await render(hbs`{{theme 'dark'}}`);

    const element = document.querySelectorAll('.highcharts-dark');
    assert.dom(element[0]).exists();
    assert.deepEqual(element[1], undefined);

    const elementShouldnotExist =
      document.querySelectorAll('.highcharts-light');
    assert.deepEqual(elementShouldnotExist[1], undefined);
  });

  test('it renders light', async function (assert) {
    await render(hbs`{{theme 'light'}}`);
    const element = document.querySelectorAll('.highcharts-light');
    assert.dom(element[0]).exists();
    assert.deepEqual(element[1], undefined);

    const elementShouldnotExist = document.querySelectorAll('.highcharts-dark');
    assert.deepEqual(elementShouldnotExist[1], undefined);
  });
});
