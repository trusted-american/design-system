import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { ListAttributesSignature } from '@trusted-american/design-system/components/list-attributes';

type Context = ListAttributesSignature<unknown>['Args'] & TestContext;

module('Integration | Component | list-attributes', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    assert.expect(8);

    this.selected = [];

    await render<Context>(hbs`
      <ListAttributes
        @presets={{array
          (hash label="Primary" values=(array "firstName" "middleName" "lastName"))
          (hash label="Secondary" values=(array "nickname" "status" "createdAt"))
        }}
        @options={{array
          (hash value="firstName" label="First name")
          (hash value="middleName" label="Middle name")
          (hash value="lastName" label="Last name")
          (hash value="nickname" label="Nickname")
          (hash value="status" label="Status")
          (hash value="createdAt" label="Created date")
        }}
        @selected={{this.selected}}
        @label="Edit columns"
        {{! @glint-expect-error }}
        @onChange={{fn (mut this.selected)}}
      />
    `);

    const preset1 = '[data-test-preset]:nth-child(1)';
    const preset2 = '[data-test-preset]:nth-child(2)';

    await click(preset1);

    assert.dom(preset1).doesNotHaveClass('invisible-icon');
    assert.dom(preset2).hasClass('invisible-icon');
    assert.deepEqual(this.selected, ['firstName', 'middleName', 'lastName']);

    await click(preset2);

    assert.dom(preset1).hasClass('invisible-icon');
    assert.dom(preset2).doesNotHaveClass('invisible-icon');
    assert.deepEqual(this.selected, ['nickname', 'status', 'createdAt']);

    await click('[data-test-option]');

    assert.dom(preset1).hasClass('invisible-icon');
    assert.dom(preset2).hasClass('invisible-icon');
  });
});
