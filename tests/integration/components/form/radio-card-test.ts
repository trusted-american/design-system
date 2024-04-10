import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, type TestContext } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

import type { FormRadioCardSignature } from '@trusted-american/design-system/components/form/radio-card';

type Context = FormRadioCardSignature<unknown>['Args'] & TestContext;

module('Integration | Component | form/radio-card', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render<Context>(hbs`
      <Form::RadioCard
        @options={{array
          (hash
            value=true
            label='Yes'
            icon='check'
            help='Help'
          )
          (hash
            value=false
            label='No'
            icon='xmark'
            help='Help'
          )
        }}
        @selected={{this.selected}}
        @label='Label'
        @identifier='radioCard'
        @onChange={{fn (mut this.selected)}}
      />
    `);

    assert.dom().hasText('Label Yes Help No Help');
  });
});
