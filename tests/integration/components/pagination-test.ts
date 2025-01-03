import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { PaginationSignature } from '@trusted-american/design-system/components/pagination';

type Context = PaginationSignature['Args'] & TestContext;

module('Integration | Component | pagination', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.curPage = 0;
    await render<Context>(hbs`
      <Pagination
        @curPage={{this.curPage}}
        @pageSize={{3}}
        @totalItems={{9}}
        @nextText='Next'
        @previousText='Previous'
        @onChange={{fn (mut this.curPage)}}
      />
    `);

    assert.dom().hasText('Previous 1 2 3 Next');
    assert.dom('ul li:nth-of-type(1)').hasText('Previous');
    assert.dom('ul li:nth-of-type(2)').hasText('1');
    assert.dom('ul li:nth-of-type(3)').hasText('2');
    assert.dom('ul li:nth-of-type(4)').hasText('3');
    assert.dom('ul li:nth-of-type(5)').hasText('Next');

    assert.deepEqual(this.curPage, 0);

    await click('ul li:nth-of-type(3) a');
    assert.deepEqual(this.curPage, 1);

    await click('ul li:nth-of-type(5) a');
    assert.deepEqual(this.curPage, 2);

    await click('ul li:nth-of-type(1) a');
    assert.deepEqual(this.curPage, 1);
  });
});
