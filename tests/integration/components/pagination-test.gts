import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { Pagination } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | pagination', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked page = 0;
    }
    const state = new State();

    await render(
      <template>
        <Pagination
          @page={{state.page}}
          @pageSize={{3}}
          @totalItems={{9}}
          @nextButtonLabel="Next"
          @previousButtonLabel="Previous"
          @viewingLabel="Viewing"
          @ofLabel="of"
          @resultsLabel="results"
          @onChange={{fn (mut state.page)}}
        />
      </template>,
    );

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
    assert.strictEqual(state.page, 1);

    await click('[data-test-previous]');
    assert.strictEqual(state.page, 0);

    await click('ul li:nth-of-type(3) a');
    assert.strictEqual(state.page, 1);

    await click('ul li:nth-of-type(5) a');
    assert.strictEqual(state.page, 2);

    await click('ul li:nth-of-type(1) a');
    assert.strictEqual(state.page, 1);
  });

  test('it renders cursor', async function (assert) {
    assert.expect(3);

    const onNext = () => {
      assert.true(true);
    };
    const onPrevious = () => {
      assert.true(true);
    };

    await render(
      <template>
        <Pagination
          @canNext={{false}}
          @canPrevious={{false}}
          @nextButtonLabel="Next"
          @previousButtonLabel="Previous"
          @viewingLabel="Viewing"
          @ofLabel="of"
          @resultsLabel="results"
          @onNext={{onNext}}
          @onPrevious={{onPrevious}}
        />
      </template>,
    );

    assert.dom().hasText('Previous Next');

    await click('[data-test-next]');
    await click('[data-test-previous]');
  });
});
