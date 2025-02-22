import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { PropertyList } from '@trusted-american/design-system';

module('Integration | Component | property-list', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <PropertyList as |list|>
          <list.item @value="Value 1" @label="Key 1" @help="This is a tooltip.">
            Value 1
          </list.item>
          <list.item @value="Value 2" @label="Key 2">
            Value 2
          </list.item>
          <list.item @value="Value 3" @label="Key 3">
            <:default>
              Value 3
            </:default>
            <:side>
              Side
            </:side>
          </list.item>
        </PropertyList>
      </template>,
    );

    assert.dom('dl dt:nth-of-type(1)').hasText('Key 1');
    assert.dom('dl dd:nth-of-type(1)').hasText('Value 1');

    assert.dom('dl dt:nth-of-type(2)').hasText('Key 2');
    assert.dom('dl dd:nth-of-type(2)').hasText('Value 2');

    assert.dom('dl dt:nth-of-type(3)').hasText('Key 3');
    assert.dom('dl dd:nth-of-type(3)').hasText('Value 3 Side');
  });

  test('it renders horizontal', async function (assert) {
    await render(
      <template>
        <PropertyList @isHorizontal={{true}} as |list|>
          <list.item @value="Value 1" @label="Key 1" @help="This is a tooltip.">
            Value 1
          </list.item>
          <list.item @value="Value 2" @label="Key 2">
            Value 2
          </list.item>
          <list.item @value="Value 3" @label="Key 3">
            <:default>
              Value 3
            </:default>
            <:side>
              Side
            </:side>
          </list.item>
        </PropertyList>
      </template>,
    );

    assert.dom('dl div:nth-of-type(1) dt').hasText('Key 1');
    assert.dom('dl div:nth-of-type(1) dd').hasText('Value 1');

    assert.dom('dl div:nth-of-type(2) dt').hasText('Key 2');
    assert.dom('dl div:nth-of-type(2) dd').hasText('Value 2');

    assert.dom('dl div:nth-of-type(3) dt').hasText('Key 3');
    assert.dom('dl div:nth-of-type(3) dd').hasText('Value 3 Side');
  });

  test('it renders with title', async function (assert) {
    await render(<template><PropertyList @title="Test" /></template>);

    assert.dom().hasText('Test');
  });
});
