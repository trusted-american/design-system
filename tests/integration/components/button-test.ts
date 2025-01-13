import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    //Text Only
    await render(hbs`<Button @text="Test" />`);
    assert.dom().hasText('Test');
    assert.dom('svg').doesNotExist(); //No Icon
    assert.dom('button div').doesNotExist(); // No Loading

    //Text with Icon
    await render(hbs`<Button @text="Test" @icon="house"/>`);
    assert.dom('svg').exists();
    assert.dom().hasText('Test');

    //Icon Only
    await render(
      hbs`<Button @text="Test" @icon="house" @isIconOnly={{true}}/>`,
    );
    assert.dom('svg').exists();
    assert.dom().doesNotIncludeText('Test');

    //Small
    await render(hbs`<Button @text="Test" @size="sm"/>`);
    assert.dom().hasText('Test');

    //Large
    await render(hbs`<Button @text="Test" @size="lg"/>`);
    assert.dom().hasText('Test');

    //Loading
    await render(hbs`<Button @text="Test" @size="lg" @isLoading={{true}}/>`);
    assert.dom('button div').exists();

    //href
    await render(hbs`<Button @text="Test" @href="#"/>`);
    assert.dom().hasText('Test');

    //count
    await render(hbs`<Button @text="Test" @count={{1738}}/>`);
    assert.dom().hasText('Test 1738');

    //Other
    await render(
      hbs`<Button @text="Test" isOutline= {{true}} @isFullWidth = {{true}} @color = "warning"/>`,
    );
    assert.dom().hasText('Test');
  });
});
