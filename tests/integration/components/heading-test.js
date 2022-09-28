import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | heading', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    this.title = 'Title';
    this.subtitle = undefined;
    this.type = undefined;
    this.code = undefined;

    await render(hbs`
      <Heading
        @title={{this.title}}
        @subtitle={{this.subtitle}}
        @type={{this.type}}
        @code={{this.code}}
      />
    `);

    assert.dom(this.element).hasText('Title');

    this.set('subtitle', 'Subtitle');

    assert.dom(this.element).hasText('Title Subtitle');

    this.set('type', 'Agent');
    this.set('code', '1');

    assert.dom(this.element).hasText('Agent 1 Title Subtitle');

    await render(hbs`
      <Heading
        @title={{this.title}}
        @subtitle={{this.subtitle}}
        @type={{this.type}}
        @code={{this.code}}
      >
        template block text
      </Heading>
    `);

    assert
      .dom(this.element)
      .hasText('Agent 1 Title Subtitle template block text');
  });
});
