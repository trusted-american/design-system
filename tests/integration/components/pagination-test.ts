import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
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
        @nextButtonLabel="Next"
        @previousButtonLabel="Previous"
        @viewingLabel="Viewing"
        @ofLabel="of"
        @resultsLabel="results"
        @onChange={{fn (mut this.page)}}
      />
    `);

    assert.dom().hasText('Viewing 1-3 of 9 results Previous 1 2 3 Next');
    assert.dom('ul li:nth-of-type(1)').hasText('Previous');
    assert.dom('ul li:nth-of-type(2)').hasText('1');
    assert.dom('ul li:nth-of-type(3)').hasText('2');
    assert.dom('ul li:nth-of-type(4)').hasText('3');
    assert.dom('ul li:nth-of-type(5)').hasText('Next');

    assert.dom('[data-test-previous]').hasText('Previous');
    assert.dom('[data-test-next]').hasText('Next');

    // assert.dom('[data-test-previous]').hasClass('disabled');
    // assert.dom('[data-test-next]').doesNotHaveClass('disabled');

    await click('[data-test-next]');
    assert.strictEqual(this.page, 1);

    await click('[data-test-previous]');
    assert.strictEqual(this.page, 0);

    await click('ul li:nth-of-type(3) a');
    assert.strictEqual(this.page, 1);

    await click('ul li:nth-of-type(5) a');
    assert.strictEqual(this.page, 2);

    await click('ul li:nth-of-type(1) a');
    assert.strictEqual(this.page, 1);
  });

  test('it renders cursor', async function (this: Context, assert) {
    assert.expect(3);

    // @ts-expect-error should exist
    this.onNext = () => {
      assert.true(true);
    };
    // @ts-expect-error should exist
    this.onPrevious = () => {
      assert.true(true);
    };

    await render<Context>(hbs`
      <Pagination
        @canNext={{false}}
        @canPrevious={{false}}
        @nextButtonLabel="Next"
        @previousButtonLabel="Previous"
        @viewingLabel="Viewing"
        @ofLabel="of"
        @resultsLabel="results"
        {{! @glint-expect-error }}
        @onNext={{this.onNext}}
        {{! @glint-expect-error }}
        @onPrevious={{this.onPrevious}}
      />
    `);

    assert.dom().hasText('Previous Next');

    await click('[data-test-next]');
    await click('[data-test-previous]');
  });
});
