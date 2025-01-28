import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { PaginationSignature } from '@trusted-american/design-system/components/pagination';

type Context = PaginationSignature['Args'] & TestContext;

module('Integration | Component | pagination', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.page = 0;

    await render<Context>(hbs`
      <Pagination
        @page={{this.page}}
        {{! @glint-expect-error }}
        @pageSize={{3}}
        @totalItems={{9}}
        @nextText='Next'
        @previousText='Previous'
        @onChange={{fn (mut this.page)}}
      />
    `);

    assert.dom().hasText('Viewing 1-3 of 9 results Previous 1 2 3 Next');
    assert.dom('ul li:nth-of-type(1)').hasText('Previous');
    assert.dom('ul li:nth-of-type(2)').hasText('1');
    assert.dom('ul li:nth-of-type(3)').hasText('2');
    assert.dom('ul li:nth-of-type(4)').hasText('3');
    assert.dom('ul li:nth-of-type(5)').hasText('Next');

    assert.deepEqual(this.page, 0);

    await click('ul li:nth-of-type(3) a');
    assert.deepEqual(this.page, 1);

    await click('ul li:nth-of-type(5) a');
    assert.deepEqual(this.page, 2);

    await click('ul li:nth-of-type(1) a');
    assert.deepEqual(this.page, 1);
  });
});
