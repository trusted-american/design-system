import fileType from '@trusted-american/design-system/utils/file-type';
import { module, test } from 'qunit';

module('Unit | Utility | file-type', function () {
  test('it works', function (assert) {
    assert.strictEqual(fileType('file.png'), 'image');
    assert.strictEqual(fileType('file.jpg'), 'image');
    assert.strictEqual(fileType('file.pdf'), 'pdf');
    assert.strictEqual(fileType(''), null);
  });
});
