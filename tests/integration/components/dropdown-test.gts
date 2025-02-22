import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, click } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | dropdown', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Button @label="Open dropdown" {{dropdown}}/>
      <Dropdown>
        <Dropdown::Item
          @label="Copy link"
          @subtitle="Due by December 31, 2021"
          @icon="copy"
          @shortcut="⌘C"
          data-test-copy
          {{on "click" (noop)}}
        />
        <Dropdown::Item
          @label="Quote reply"
          @icon="quote-left"
          @shortcut="⌘Q"
          data-test-quote
          {{on "click" (noop)}}
        />
        <Dropdown::Item
          @label="Edit comment"
          @icon="pen"
          @shortcut="⌘E"
          data-test-comment
          {{on "click" (noop)}}
        />
        <Dropdown::Divider data-test-divider/>
        <Dropdown::Item
          @label="Delete file"
          @icon="trash"
          @shortcut="⌘D"
          @color="danger"
          data-test-delete
          {{on "click" (noop)}}
        />
        <Dropdown::Divider />
        <Dropdown::Item @label="Route" @icon="plus" @route="index" data-test-route/>
        <Dropdown::Header @label="Header" data-test-header/>
        <Dropdown::Item @label="Href" @icon="plus" @href="https://www.google.com/" data-test-href/>
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
