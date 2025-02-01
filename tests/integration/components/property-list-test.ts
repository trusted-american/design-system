import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | property-list', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <PropertyList as |list|>
        <list.item
          @label="Key 1"
          @value="Value 1"
          @alt={{false}}
          @help="This is a tooltip."
        >
          Value 1
        </list.item>
        <list.item @label="Key 2" @value="Value 2" @alt={{false}}>
          Value 2
        </list.item>
        <list.item @label="Key 3" @value="Value 3" @alt={{false}}>
          <:default>
            Value 3
          </:default>
          <:side>
            Side
          </:side>
        </list.item>
      </PropertyList>
    `);

    assert.dom('dl dt:nth-of-type(1)').hasText('Key 1');
    assert.dom('dl dd:nth-of-type(1)').hasText('Value 1');

    assert.dom('dl dt:nth-of-type(2)').hasText('Key 2');
    assert.dom('dl dd:nth-of-type(2)').hasText('Value 2');

    assert.dom('dl dt:nth-of-type(3)').hasText('Key 3');
    assert.dom('dl dd:nth-of-type(3)').hasText('Value 3 Side');
  });

  test('it renders horizontal', async function (assert) {
    await render(hbs`
      <PropertyList @isHorizontal={{true}}  as |list|>
        <list.item
          @label="Key 1"
          @value="Value 1"
          @alt={{false}}
          @help="This is a tooltip."
        >
          Value 1
        </list.item>
        <list.item @label="Key 2" @value="Value 2" @alt={{false}}>
          Value 2
        </list.item>
        <list.item @label="Key 3" @value="Value 3" @alt={{false}}>
          <:default>
            Value 3
          </:default>
          <:side>
            Side
          </:side>
        </list.item>
      </PropertyList>
    `);

    assert.dom('dl div:nth-of-type(1) dt').hasText('Key 1');
    assert.dom('dl div:nth-of-type(1) dd').hasText('Value 1');

    assert.dom('dl div:nth-of-type(2) dt').hasText('Key 2');
    assert.dom('dl div:nth-of-type(2) dd').hasText('Value 2');

    assert.dom('dl div:nth-of-type(3) dt').hasText('Key 3');
    assert.dom('dl div:nth-of-type(3) dd').hasText('Value 3 Side');
  });

  test('it renders with title', async function (assert) {
    await render(hbs`<PropertyList @title='Test'></PropertyList>`);

    assert.dom().hasText('Test');
  });
});
