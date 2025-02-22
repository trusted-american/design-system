import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import {
  Button,
  Dropdown,
  DropdownDivider,
  DropdownHeader,
  DropdownItem,
} from '@trusted-american/design-system';
import { on } from '@ember/modifier';
import { noop } from '@nullvoxpopuli/ember-composable-helpers';
import dropdown from '@trusted-american/design-system/modifiers/dropdown';

module('Integration | Component | dropdown', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Button @label="Open dropdown" {{dropdown}} />
        <Dropdown>
          <DropdownItem
            @label="Copy link"
            @subtitle="Due by December 31, 2021"
            @icon="copy"
            @shortcut="⌘C"
            data-test-copy
            {{on "click" (noop)}}
          />
          <DropdownItem
            @label="Quote reply"
            @icon="quote-left"
            @shortcut="⌘Q"
            data-test-quote
            {{on "click" (noop)}}
          />
          <DropdownItem
            @label="Edit comment"
            @icon="pen"
            @shortcut="⌘E"
            data-test-comment
            {{on "click" (noop)}}
          />
          <DropdownDivider data-test-divider />
          <DropdownItem
            @label="Delete file"
            @icon="trash"
            @shortcut="⌘D"
            @color="danger"
            data-test-delete
            {{on "click" (noop)}}
          />
          <DropdownDivider />
          <DropdownItem
            @label="Route"
            @icon="plus"
            @route="index"
            data-test-route
          />
          <DropdownHeader @label="Header" data-test-header />
          <DropdownItem
            @label="Href"
            @icon="plus"
            @href="https://www.google.com/"
            data-test-href
          />
        </Dropdown>
      </template>,
    );

    await click('[data-bs-toggle]');
    assert.dom('[data-test-copy]').exists();
    assert.dom('[data-test-quote]').exists();
    assert.dom('[data-test-comment]').exists();
    assert.dom('[data-test-divider]').exists();
    assert.dom('[data-test-delete]').exists();
    assert.dom('[data-test-route]').exists();
    assert.dom('[data-test-header]').exists();
    assert.dom('[data-test-href]').exists();

    assert
      .dom()
      .hasText(
        'Open dropdown Copy link Due by December 31, 2021 ⌘C Quote reply ⌘Q Edit comment ⌘E Delete file ⌘D Route Header Href',
      );
  });
});
