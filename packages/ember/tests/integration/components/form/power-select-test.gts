import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, render } from '@ember/test-helpers';
import { Button, FormPowerSelect } from '@trusted-american/ember';
import { selectChoose, selectSearch } from 'ember-power-select/test-support';
import { tracked } from '@glimmer/tracking';
import { array, fn } from '@ember/helper';
import { on } from '@ember/modifier';
import checkValidity from '@trusted-american/ember/utils/check-validity';
import { action } from '@ember/object';

module('Integration | Component | form/power-select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked selected: string | null = null;
    }
    const state = new State();

    await render(
      <template>
        <FormPowerSelect
          @options={{array "a" "b" "c"}}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{fn (mut state.selected)}}
          as |option|
        >
          {{option}}
        </FormPowerSelect>
      </template>,
    );

    assert.dom().hasText('Label Choose…');

    await selectChoose('#identifier', '.ember-power-select-option', 0);

    assert.strictEqual(state.selected, 'a');
  });

  test('it supports create', async function (assert) {
    class State {
      @tracked selected: string | null = null;
    }
    const state = new State();

    await render(
      <template>
        <FormPowerSelect
          @options={{array "a" "b" "c"}}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @chooseLabel="Choose…"
          @searchLabel="Search…"
          @onChange={{fn (mut state.selected)}}
          @onCreate={{fn (mut state.selected)}}
          as |option|
        >
          {{option}}
        </FormPowerSelect>
      </template>,
    );

    await selectSearch('#identifier', 'd');
    await selectChoose('#identifier', '.ember-power-select-option', 0);

    assert.strictEqual(state.selected, 'd');
  });

  test('it validates', async function (assert) {
    class State {
      @tracked selected: string | null = null;

      @action
      @checkValidity
      submit() {
        //
      }
    }
    const state = new State();

    await render(
      <template>
        <form novalidate {{on "submit" state.submit}}>
          <FormPowerSelect
            @options={{array "a" "b" "c"}}
            @selected={{state.selected}}
            @label="Label"
            @identifier="identifier"
            @isRequired={{true}}
            @requiredLabel="Required"
            @validLabel="Looks good!"
            @invalidLabel="This is an example of invalid feedback."
            @chooseLabel="Choose…"
            @searchLabel="Search…"
            @onChange={{fn (mut state.selected)}}
            as |option|
          >
            {{option}}
          </FormPowerSelect>
          <Button @type="submit" @label="Submit" @color="primary" />
        </form>
      </template>,
    );

    await click('[data-test-button]');

    await new Promise((resolve) => setTimeout(resolve, 250));

    assert.dom('.ember-power-select-trigger').hasStyle({
      borderColor: 'rgb(220, 53, 69)',
    });

    state.selected = 'a';

    await new Promise((resolve) => setTimeout(resolve, 250));

    assert.dom('.ember-power-select-trigger').hasStyle({
      borderColor: 'rgb(25, 135, 84)',
    });
  });
});
