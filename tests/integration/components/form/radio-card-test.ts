import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/radio-card', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`
      <Form::RadioCard
        @options={{array
          (hash
            value=true
            label="Yes"
            icon="check"
            help="Help"
          )
          (hash
            value=false
            label="No"
            icon="xmark"
            help="Help"
          )
        }}
        {{! @glint-expect-error }}
        @selected={{this.xyz}}
        @label="Label"
        @identifier="radioCard"
        {{! @glint-expect-error }}
        @onChange={{fn (mut this.xyz)}}
      />
    `);

    assert.dom().hasText('Label Yes Help No Help');
  });
});
