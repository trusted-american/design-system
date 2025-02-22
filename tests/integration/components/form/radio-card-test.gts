import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { FormRadioCard } from '@trusted-american/design-system';
import { array, fn, hash } from '@ember/helper';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | form/radio-card', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked({ selected: false });

    await render(
      <template>
        <FormRadioCard
          @options={{array
            (hash value=true label="Yes" icon="check" help="Help")
            (hash value=false label="No" icon="xmark" help="Help")
          }}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @onChange={{fn (mut state.selected)}}
        />
      </template>,
    );

    assert.dom().hasText('Label Yes Help No Help');
  });
});
