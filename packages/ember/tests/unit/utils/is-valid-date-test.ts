import isValidDate from '@trusted-american/design-system/utils/is-valid-date';
import { module, test } from 'qunit';

module('Unit | Utility | is-valid-date', function () {
  test('it works', function (assert) {
    assert.ok(isValidDate(new Date()));
    assert.notOk(isValidDate(null));
    assert.notOk(isValidDate(0));
    assert.notOk(isValidDate(''));
  });
});
