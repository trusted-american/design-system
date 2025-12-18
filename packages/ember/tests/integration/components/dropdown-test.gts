import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import {
  Button,
  Dropdown,
  DropdownHeader,
  dropdown,
} from '@trusted-american/ember';
import {
  faCopy,
  faPen,
  faPlus,
  faQuoteLeft,
  faTrash,
} from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | dropdown', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Button @label="Open dropdown" {{dropdown}} />
        <Dropdown as |dropdown|>
          <dropdown.item
            @label="Copy link"
            @subtitle="Due by December 31, 2021"
            @icon={{faCopy}}
            @shortcut="⌘C"
            data-test-copy
          />
          <dropdown.item
            @label="Quote reply"
            @icon={{faQuoteLeft}}
            @shortcut="⌘Q"
            data-test-quote
          />
          <dropdown.item
            @label="Edit comment"
            @icon={{faPen}}
            @shortcut="⌘E"
            data-test-comment
          />
          <dropdown.divider />
          <dropdown.item
            @label="Delete file"
            @icon={{faTrash}}
            @shortcut="⌘D"
            @color="danger"
            data-test-delete
          />
          <dropdown.divider />
          <dropdown.item
            @label="Route"
            @icon={{faPlus}}
            @route="index"
            data-test-route
          />
          <DropdownHeader @label="Header" data-test-header />
          <dropdown.item
            @label="Href"
            @icon={{faPlus}}
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
    assert.dom('[data-test-dropdown-divider]').exists();
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
