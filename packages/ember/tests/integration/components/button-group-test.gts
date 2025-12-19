import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import ButtonGroup from '@trusted-american/ember/components/button-group';
import { faHouse } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | button-group', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ButtonGroup as |buttonGroup|>
          <buttonGroup.button @label="Hi" />
          <buttonGroup.button @label="Actually" />
          <buttonGroup.button @label="Bye" />
          <buttonGroup.button
            @label="This Shouldnt Show Up"
            @icon={{faHouse}}
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
