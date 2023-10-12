import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | form/power-select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    await render(hbs`
      <Form::PowerSelect
        @options={{(array)}}
        @selected={{null}}
        @label='Label'
        @identifier='identifier'
        @onChange={{(noop)}}
        as |option|
      >
        {{! @glint-ignore }}
        {{option}}
      </Form::PowerSelect>
    `);

    assert.dom().hasText('Label Choose…');
  });
});
