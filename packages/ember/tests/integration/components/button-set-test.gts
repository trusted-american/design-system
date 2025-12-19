import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import ButtonSet from '@trusted-american/ember/components/button-set';
import { faHouse } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | button-set', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <ButtonSet as |buttonSet|>
          <buttonSet.button @label="Hi" />
          <buttonSet.button @label="Actually" />
          <buttonSet.button @label="Bye" />
          <buttonSet.button
            @label="This Shouldnt Show Up"
            @icon={{faHouse}}
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
