import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import ListFilter, {
  type Predicate,
} from '@trusted-american/design-system/components/list-filter';

module('Integration | Component | list-filter', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.expect(3 + 5);

    const predicates: Predicate[] = [
      {
        type: 'single',
        name: 'Status',
        key: 'status',
        value: undefined,
        options: [
          { value: 'one', label: 'One' },
          { value: 'two', label: 'Two' },
          { value: 'three', label: 'Three' },
        ],
      },
      {
        type: 'single',
        name: 'Archived',
        key: 'isArchived',
        value: undefined,
        options: [
          { value: true, label: 'True' },
          { value: false, label: 'False' },
        ],
      },
      {
        type: 'multi',
        name: 'State',
        key: 'state',
        value: [],
        options: [
          { value: 'az', label: 'AZ' },
          { value: 'ca', label: 'CA' },
        ],
      },
      {
        type: 'string',
        name: 'City',
        key: 'city',
        value: undefined,
      },
      {
        type: 'date',
        name: 'Created Date',
        key: 'createdAt',
        value: [],
      },
    ];
    const onChange = () => {
      assert.true(true);
    };

    await render(<template>
      <ListFilter @predicates={{predicates}} @onChange={{onChange}} />
    </template>);

    assert.dom('[data-test-list-filter]').hasText('Filter');
    assert.dom('[data-test-predicate-toggle]').exists({ count: 5 });

    await click('[data-test-predicate-toggle] input');

    assert.dom('[data-test-predicate-value]').exists({ count: 1 });

    await click('[data-test-done]');
  });
});
