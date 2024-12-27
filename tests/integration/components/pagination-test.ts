import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { PaginationSignature } from '@trusted-american/design-system/components/pagination';

type Context = PaginationSignature['Args'] & TestContext;

module('Integration | Component | pagination', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<Context>(hbs`
      <Pagination
        @curPage={{0}}
        @pageSize={{3}}
        @totalItems={{9}}
        @nextText='Next'
        @previousText='Previous'
        @onChange={{fn (mut this.curPage)}}
      />
    `);

    assert.dom().hasText('Previous 1 2 3 Next');
  });
});
