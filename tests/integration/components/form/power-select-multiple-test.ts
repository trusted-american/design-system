import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module(
  'Integration | Component | form/power-select-multiple',
  function (hooks) {
    setupRenderingTest(hooks);

    test('it renders', async function (assert) {
      await render(hbs`
        <Form::PowerSelectMultiple
          @options={{(array)}}
          @selected={{(array)}}
          @label='Label'
          @identifier='identifier'
          @onChange={{(noop)}}
          @onCreate={{(noop)}}
          as |option|
        >
          {{! @glint-ignore }}
          {{option}}
        </Form::PowerSelectMultiple>
      `);

      assert.dom().hasText('Label');
    });
  }
);
