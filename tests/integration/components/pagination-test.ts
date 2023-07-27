import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | pagination', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`<Pagination
    @curPage={{0}}
    @perPage={{3}}
    @totalItems={{9}}
    {{! @glint-ignore }}
    @onChange={{fn (mut this.page)}}
  />`);

    assert.dom().hasText('Previous 1 2 3 Next');
  });
});
