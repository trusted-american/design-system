import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { BreadcrumbTrail } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';

module('Integration | Component | breadcrumb-trail', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(
      <template>
        {{breadcrumb "First" route="index"}}
        {{breadcrumb "Second" route="index"}}
        {{breadcrumb "Third"}}

        <BreadcrumbTrail />
      </template>,
    );

    assert.dom('[data-test-breadcrumb-trail]').hasText('First Second Third');
    assert.dom('[data-test-breadcrumb-trail-item]').exists({ count: 3 });
    assert
      .dom('[data-test-breadcrumb-trail-item] [data-test-link]')
      .exists({ count: 2 });
  });
});
