import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Button, ButtonSet } from '@trusted-american/design-system';

module('Integration | Component | button-set', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ButtonSet>
          <Button @label="Hi" />
          <Button @label="Actually" />
          <Button @label="Bye" />
          <Button
            @label="This Shouldnt Show Up"
            @icon="house"
            @isIconOnly={{true}}
          />
        </ButtonSet>
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
