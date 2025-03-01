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
            (hash value=true label="Yes" help="Help" icon="check")
            (hash value=false label="No" help="Help" icon="xmark")
          }}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @onChange={{fn (mut state.selected)}}
        />
      </template>,
    );

    assert.dom().hasText('Label Yes Help No Help');
  });
});
