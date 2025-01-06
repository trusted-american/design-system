import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import Theme from '@trusted-american/design-system/helpers/theme';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Helper | theme', function (hooks) {
  setupRenderingTest(hooks);

  hooks.beforeEach(function () {
    localStorage.removeItem('isDarkMode');
  });

  test('it renders dark', async function (assert) {
    localStorage.setItem('isDarkMode', 'dark');

    await render(hbs`{{theme}}`);

    const element = document.querySelectorAll('.highcharts-dark');
    assert.dom(element[0]).exists();
    assert.deepEqual(element[1], undefined);

    const elementShouldnotExist =
      document.querySelectorAll('.highcharts-light');
    assert.deepEqual(elementShouldnotExist[1], undefined);

    localStorage.removeItem('isDarkMode');
  });

  test('it renders back to light', async function (assert) {
    localStorage.setItem('isDarkMode', 'light');
    await render(hbs`{{theme}}`);
    const element = document.querySelectorAll('.highcharts-light');
    assert.dom(element[0]).exists();
    assert.deepEqual(element[1], undefined);

    const elementShouldnotExist = document.querySelectorAll('.highcharts-dark');
    assert.deepEqual(elementShouldnotExist[1], undefined);

    localStorage.removeItem('isDarkMode');
  });
});
