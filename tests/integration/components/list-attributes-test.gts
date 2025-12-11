import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import ListAttributes from '@trusted-american/design-system/components/list-attributes';
import { array, fn, hash } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | list-attributes', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked selected: (string | number)[] = [];
    }
    const state = new State();

    await render(
      <template>
        <ListAttributes
          @presets={{array
            (hash
              label="Primary" values=(array "firstName" "middleName" "lastName")
            )
            (hash
              label="Secondary" values=(array "nickname" "status" "createdAt")
            )
          }}
          @options={{array
            (hash value="firstName" label="First name")
            (hash value="middleName" label="Middle name")
            (hash value="lastName" label="Last name")
            (hash value="nickname" label="Nickname")
            (hash value="status" label="Status")
            (hash value="createdAt" label="Created date")
          }}
          @selected={{state.selected}}
          @label="Edit columns"
          @onChange={{fn (mut state.selected)}}
        />
      </template>,
    );

    const preset1 = '[data-test-preset]:nth-child(1)';
    const preset2 = '[data-test-preset]:nth-child(2)';

    await click(preset1);

    assert.dom(preset1 + ' [data-test-icon]').doesNotHaveClass('invisible');
    assert.dom(preset2 + ' [data-test-icon]').hasClass('invisible');
    assert.deepEqual(state.selected, ['firstName', 'middleName', 'lastName']);

    await click(preset2);

    assert.dom(preset1 + ' [data-test-icon]').hasClass('invisible');
    assert.dom(preset2 + ' [data-test-icon]').doesNotHaveClass('invisible');
    assert.deepEqual(state.selected, ['nickname', 'status', 'createdAt']);

    await click('[data-test-option]');

    assert.dom(preset1 + ' [data-test-icon]').hasClass('invisible');
    assert.dom(preset2 + ' [data-test-icon]').hasClass('invisible');
  });
});
