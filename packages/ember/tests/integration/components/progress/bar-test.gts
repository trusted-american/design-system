import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import ProgressBar from '@trusted-american/ember/components/progress/bar';

module('Integration | Component | progress/bar', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(<template><ProgressBar @value={{0}} /></template>);
    assert.dom().hasText('');
  });

  test('it renders with color', async function (assert) {
    await render(
      <template><ProgressBar @value={{10}} @color="danger" /></template>,
    );
    assert.dom('.bg-danger').exists();
  });

  test('it renders with label', async function (assert) {
    await render(
      <template>
        <ProgressBar @value={{10}} @color="danger" @isLabeled={{true}} />
      </template>,
    );
    assert.dom('.bg-danger').exists();
    assert.dom().hasText('10%');
  });

  test('it renders with stripes', async function (assert) {
    await render(
      <template>
        <ProgressBar
          @value={{10}}
          @color="danger"
          @isLabeled={{true}}
          @isStriped={{true}}
        />
      </template>,
    );
    assert.dom('.progress-bar-striped').exists();
  });

  test('it renders with animation', async function (assert) {
    await render(
      <template>
        <ProgressBar
          @value={{10}}
          @color="danger"
          @isLabeled={{true}}
          @isStriped={{true}}
          @isAnimated={{true}}
        />
      </template>,
    );
    assert.dom('.progress-bar-animated').exists();
  });
});
