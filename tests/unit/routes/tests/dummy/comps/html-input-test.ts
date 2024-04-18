import { module, test } from 'qunit';
import { setupTest } from 'dummy/tests/helpers';

module('Unit | Route | tests/dummy/comps/html-input', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    const route = this.owner.lookup('route:tests/dummy/comps/html-input');
    assert.ok(route);
  });
});
