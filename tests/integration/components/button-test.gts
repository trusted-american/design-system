import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Button } from '@trusted-american/design-system';
import { faHouse } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    //Text Only
    await render(<template><Button @label="Test" /></template>);
    assert.dom().hasText('Test');
    assert.dom('[data-test-icon]').doesNotExist(); // no icon
    assert.dom('button div').doesNotExist(); // no loading

    //Text with Icon
    await render(
      <template><Button @label="Test" @icon={{faHouse}} /></template>,
    );
    assert.dom('[data-test-icon]').exists();
    assert.dom().hasText('Test');

    //Icon Only
    await render(
      <template>
        <Button @label="Test" @icon={{faHouse}} @isIconOnly={{true}} />
      </template>,
    );
    assert.dom('[data-test-icon]').exists();
    assert.dom().doesNotIncludeText('Test');

    //Small
    await render(<template><Button @label="Test" @size="sm" /></template>);
    assert.dom().hasText('Test');

    //Large
    await render(<template><Button @label="Test" @size="lg" /></template>);
    assert.dom().hasText('Test');

    //Loading
    await render(
      <template>
        <Button @label="Test" @size="lg" @isLoading={{true}} />
      </template>,
    );
    assert.dom('button div').exists();

    //href
    await render(<template><Button @label="Test" @href="#" /></template>);
    assert.dom().hasText('Test');

    //count
    await render(<template><Button @label="Test" @count={{1738}} /></template>);
    assert.dom().hasText('Test 1738');

    //Other
    await render(
      <template>
        <Button
          @label="Test"
          isOutline={{true}}
          @isFullWidth={{true}}
          @color="warning"
        />
      </template>,
    );
    assert.dom().hasText('Test');
  });
});
