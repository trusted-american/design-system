import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import Theme from '@trusted-american/design-system/helpers/theme';

module('Integration | Helper | theme', function (hooks) {
  setupRenderingTest(hooks);

  hooks.beforeEach(function () {
    localStorage.removeItem('isDarkMode');
  });

  test('it renders dark', async function (assert) {
    localStorage.setItem('isDarkMode', 'dark');
    await render(
      <template>
        <div>
          {{theme}}
          <h1>Hello World</h1>
          <h2>Goodbye World</h2>
        </div>
      </template>,
    );
    const element = document.querySelectorAll('.highcharts-dark');
    assert.dom(element[0]).exists();
    assert.equal(element[1], undefined);

    const elementShouldnotExist =
      document.querySelectorAll('.highcharts-light');
    assert.equal(elementShouldnotExist[1], undefined);

    localStorage.removeItem('isDarkMode');
  });

  test('it renders back to light', async function (assert) {
    localStorage.setItem('isDarkMode', 'light');
    await render(
      <template>
        <div>
          {{theme}}
          <h1>Hello World</h1>
          <h2>Goodbye World</h2>
        </div>
      </template>,
    );
    const element = document.querySelectorAll('.highcharts-light');
    assert.dom(element[0]).exists();
    assert.equal(element[1], undefined);

    const elementShouldnotExist = document.querySelectorAll('.highcharts-dark');
    assert.equal(elementShouldnotExist[1], undefined);

    localStorage.removeItem('isDarkMode');
  });
});