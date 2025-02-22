import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { Placeholder } from '@trusted-american/design-system';

module('Integration | Component | placeholder', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    assert.true(true);

    await render(
      <template>
        <Placeholder @icon="xmark" @title="Title" @subtitle="Subtitle" />
      </template>,
    );

    assert.dom('[data-test-icon]').hasClass('fa-xmark');
    assert.dom('[data-test-title]').hasText('Title');
    assert.dom('[data-test-subtitle]').hasText('Subtitle');
  });
});
