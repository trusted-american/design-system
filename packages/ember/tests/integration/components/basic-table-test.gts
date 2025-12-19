import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import BasicTable from '@trusted-american/ember/components/basic-table';

module('Integration | Component | basic-table', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <BasicTable>
          template block text
        </BasicTable>
      </template>,
    );

    assert.dom().hasText('template block text');

    await render(
      <template>
        <BasicTable @isSmall={{true}}>
          template block text
        </BasicTable>
      </template>,
    );

    assert.dom().hasText('template block text');

    await render(
      <template>
        <BasicTable @isBordered={{true}}>
          template block text
        </BasicTable>
      </template>,
    );

    assert.dom().hasText('template block text');
  });
});
