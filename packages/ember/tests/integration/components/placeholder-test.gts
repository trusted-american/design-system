import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Placeholder } from '@trusted-american/ember';
import { faXmark } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | placeholder', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const onClick = () => {
      //
    };

    await render(
      <template>
        <Placeholder
          @icon={{faXmark}}
          @title="Title"
          @subtitle="Subtitle"
          @buttonLabel="Button"
          @onClick={{onClick}}
        />
      </template>,
    );

    assert.dom('[data-test-icon]').hasClass('fa-xmark');
    assert.dom('[data-test-title]').hasText('Title');
    assert.dom('[data-test-subtitle]').hasText('Subtitle');
    assert.dom('[data-test-button]').exists();
  });
});
