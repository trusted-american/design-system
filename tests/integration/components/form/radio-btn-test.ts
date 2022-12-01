import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { Option } from '@trusted-american/design-system/components/form/select';

interface Context extends TestContext {
  options: Option[];
  selected: unknown;
  identifier: string;
  size: 'sm' | 'lg';
  color: string;
  change: (selected: unknown) => void;
}

module('Integration | Component | form/radio-btn', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    assert.expect(1);

    this.options = [
      { value: 'one', label: 'One' },
      { value: 'two', label: 'Two' },
    ];
    this.selected = undefined;
    this.identifier = 'identifier';
    this.size = 'sm';
    this.color = 'success';
    this.change = (selected) => {
      assert.ok(selected);
    };

    await render(hbs`
      <Form::RadioBtn
        @options={{this.options}}
        @selected={{this.selected}}
        @identifier={{this.identifier}}
        @size={{this.size}}
        @color={{this.color}}
        @onChange={{this.change}}
      />
    `);

    assert.dom(this.element as Element).hasText('One Two');
  });
});
