import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { Option } from '@trusted-american/design-system/components/form/select';
import type {
  ListAttributesKey,
  ListAttributesPreset,
} from '@trusted-american/design-system/components/list-attributes';

module('Integration | Component | list-attributes', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.expect(8);

    const state = tracked<{
      selected: ListAttributesKey<ClientModel>[];
    }>({
      selected: [],
    });

    const presets: ListAttributesPreset<ClientModel>[] = [
      {
        label: 'Primary',
        values: ['firstName', 'middleName', 'lastName'],
      },
      {
        label: 'Secondary',
        values: ['nickname', 'status', 'createdAt'],
      },
    ];
    const options: Option<keyof ClientModel>[] = [
      { label: 'First Name', value: 'firstName' },
      { label: 'Middle Name', value: 'middleName' },
      { label: 'Last Name', value: 'lastName' },
      { label: 'Nickname', value: 'nickname' },
      { label: 'Status', value: 'status' },
      { label: 'Created Date', value: 'createdAt' },
    ];
    const onChange = (values: ListAttributesKey<ClientModel>[]) => {
      state.selected = values;
    };

    await render(hbs`
      <ListAttributes
        @presets={{presets}}
        @options={{options}}
        @selected={{state.selected}}
        @text="Edit columns"
        @onChange={{onChange}}
      />
    `);

    const preset1 = '[data-test-preset]:nth-child(1)';
    const preset2 = '[data-test-preset]:nth-child(2)';

    await click(preset1);

    assert.dom(preset1).doesNotHaveClass('invisible-icon');
    assert.dom(preset2).hasClass('invisible-icon');
    assert.deepEqual(state.selected, ['firstName', 'middleName', 'lastName']);

    await click(preset2);

    assert.dom(preset1).hasClass('invisible-icon');
    assert.dom(preset2).doesNotHaveClass('invisible-icon');
    assert.deepEqual(state.selected, ['nickname', 'status', 'createdAt']);

    await click('[data-test-option]');

    assert.dom(preset1).hasClass('invisible-icon');
    assert.dom(preset2).hasClass('invisible-icon');
  });
});
