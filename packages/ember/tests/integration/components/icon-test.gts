import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Icon } from '@trusted-american/ember';
import { faBook } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | icon', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        <Icon
          @icon={{faBook}}
          @color="danger"
          @isFixedWidth={{true}}
          @size="lg"
        />
      </template>,
    );

    assert.dom('[data-test-icon]').hasClass('text-danger');
    assert.dom('[data-test-icon]').hasClass('fa-fw');
    assert.dom('[data-test-icon]').hasClass('fa-lg');
  });
});
