import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import FormRadioCard from '@trusted-american/ember/components/form/radio-card';
import { array, fn, hash } from '@ember/helper';
import { tracked } from '@glimmer/tracking';
import { faCheck, faXmark } from '@fortawesome/free-solid-svg-icons';

module('Integration | Component | form/radio-card', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked selected = false;
    }
    const state = new State();

    await render(
      <template>
        <FormRadioCard
          @options={{array
            (hash value=true label="Yes" help="Help" icon=faCheck)
            (hash value=false label="No" help="Help" icon=faXmark)
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

    await click('#identifier0');

    assert.true(state.selected);
  });
});
