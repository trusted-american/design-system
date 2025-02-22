import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Button, ButtonGroup } from '@trusted-american/design-system';

module('Integration | Component | button-group', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ButtonGroup>
          template block text
        </ButtonGroup>
      </template>,
    );

    assert.dom().hasText('template block text');

    await render(
      <template>
        <ButtonGroup>
          <Button @label="Hi" />
          <Button @label="Actually" />
          <Button @label="Bye" />
          <Button
            @label="This Shouldnt Show Up"
            @icon="house"
            @isIconOnly={{true}}
          />
        </ButtonGroup>
      </template>,
    );

    assert.dom('button:nth-of-type(1)').hasText('Hi');
    assert.dom('button:nth-of-type(2)').hasText('Actually');
    assert.dom('button:nth-of-type(3)').hasText('Bye');
    assert
      .dom('button:nth-of-type(4)')
      .doesNotContainText('This Should Show Up');
    assert.dom('button:nth-of-type(4) svg').exists();
  });
});
