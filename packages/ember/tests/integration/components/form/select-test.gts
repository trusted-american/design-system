import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, select } from '@ember/test-helpers';
import FormSelect from '@trusted-american/ember/components/form/select';
import { array, fn, hash } from '@ember/helper';
import { tracked } from '@glimmer/tracking';

module('Integration | Component | form/select', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked selected = '';
    }
    const state = new State();

    await render(
      <template>
        <FormSelect
          @options={{array
            (hash value="a" label="A")
            (hash value="b" label="B")
            (hash value="c" label="C")
          }}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidLabel="Invalid feedback"
          @requiredLabel="Required"
          @onChange={{fn (mut state.selected)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('select').hasAttribute('id', 'identifier');
    assert.dom('select').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-feedback]').exists();

    await select('[data-test-form-select]', '2');

    assert.strictEqual(state.selected, 'c');
  });

  test('it works with heterogeneous options', async function (assert) {
    class State {
      @tracked selected = '';
    }
    const state = new State();

    await render(
      <template>
        <FormSelect
          @options={{array
            "a"
            (hash value="b" label="B")
            (hash
              groupLabel="Label"
              options=(array
                (hash value="c" label="C") (hash value="d" label="D")
              )
            )
          }}
          @selected={{state.selected}}
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @requiredLabel="Required"
          @chooseLabel="Choose…"
          @onChange={{fn (mut state.selected)}}
        />
      </template>,
    );

    await select('[data-test-form-select]', '0');

    assert.strictEqual(state.selected, 'a');

    await select('[data-test-form-select]', '1');

    assert.strictEqual(state.selected, 'b');

    await select('[data-test-form-select]', '2-0');

    assert.strictEqual(state.selected, 'c');

    await select('[data-test-form-select]', '2-1');

    assert.strictEqual(state.selected, 'd');

    await select('[data-test-form-select]', '');

    assert.strictEqual(state.selected, null);
  });
});
