import checkValidity from '@trusted-american/ember/utils/check-validity';
import { module, test } from 'qunit';

module('Unit | Utility | check-validity', function () {
  test('it works', function (assert) {
    class Example {
      @checkValidity
      doSomething() {
        assert.true(true);
      }
    }

    const example = new Example();

    const element = document.createElement('form');
    element.addEventListener('submit', example.doSomething.bind(example));

    const event = new Event('submit');
    element.dispatchEvent(event);
  });
});
