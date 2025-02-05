import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | dropdown', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Button @text="Open dropdown" {{dropdown}}/>
      <Dropdown>
        <Dropdown::Item
          @text="Copy link"
          @subtitle="Due by December 31, 2021"
          @icon="copy"
          @shortcut="⌘C"
          {{on "click" (noop)}}
          data-test-copy
        />
        <Dropdown::Item
          @text="Quote reply"
          @icon="quote-left"
          @shortcut="⌘Q"
          {{on "click" (noop)}}
          data-test-quote
        />
        <Dropdown::Item
          @text="Edit comment"
          @icon="pen"
          @shortcut="⌘E"
          {{on "click" (noop)}}
          data-test-comment
        />
        <Dropdown::Divider data-test-divider/>
        <Dropdown::Item
          @text="Delete file"
          @icon="trash"
          @shortcut="⌘D"
          @color="danger"
          {{on "click" (noop)}}
          data-test-delete
        />
        <Dropdown::Divider />
        <Dropdown::Item @text="Route" @icon="plus" @route="index" data-test-route/>
        <Dropdown::Header @text="Header" data-test-header/>
        <Dropdown::Item @text="Href" @icon="plus" @href="https://www.google.com/" data-test-href/>
      </Dropdown>
    `);

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
