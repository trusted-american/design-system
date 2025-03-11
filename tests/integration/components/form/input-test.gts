import { module, skip, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { click, fillIn, render } from '@ember/test-helpers';
import { Button, FormInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { tracked } from 'tracked-built-ins';

module('Integration | Component | form/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    const state = tracked({ value: '' });

    await render(
      <template>
        <FormInput
          @value={{state.value}}
          @type="text"
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidLabel="Invalid feedback"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('[data-test-form-input]').hasAttribute('id', 'identifier');
    assert.dom('[data-test-form-input]').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-feedback]').exists();
  });

  test('it defaults to text type', async function (assert) {
    const state = tracked({ value: '' });

    await render(
      <template>
        <FormInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').hasAttribute('type', 'text');
  });

  test('it loads initial value', async function (assert) {
    const state = tracked({ value: 'Value' });

    await render(
      <template>
        <FormInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').hasValue('Value');
  });

  test('it updates value', async function (assert) {
    const state = tracked({ value: '' });

    await render(
      <template>
        <FormInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    await fillIn('[data-test-form-input]', 'test');

    assert.strictEqual(state.value, 'test');
  });

  skip('invalidLabel works', async function (assert) {
    const state = tracked({ value: '' });

    const submit = (event: Event) => {
      event.preventDefault();

      const { target } = event;
      if (!(target instanceof HTMLFormElement)) {
        throw new Error();
      }

      if (!target.checkValidity()) {
        target.classList.add('was-validated');
      } else {
        target.classList.remove('was-validated');
        return;
      }
    };

    await render(
      <template>
        <form novalidate {{on "submit" submit}}>
          <FormInput
            @value={{state.value}}
            @label="Label"
            @identifier="identifier"
            @isRequired={{true}}
            @invalidLabel="Wrong"
            @requiredLabel="Required"
            @onChange={{fn (mut state.value)}}
          />
          <Button @type="submit" @label="Submit" data-test-submit />
        </form>
      </template>,
    );

    assert.dom('form div').hasStyle({ height: '38px' });
    assert.dom('form').doesNotHaveClass('was-validated');
    await click('[data-test-submit]');
    assert.dom('form').hasClass('was-validated');
    assert.dom('[data-test-form-feedback]').hasText('Wrong');
    assert.dom('form div').hasStyle({ height: '63px' });
  });

  test('it adds aria-label attribute', async function (assert) {
    const state = tracked({ value: '' });

    await render(
      <template>
        <FormInput
          @value={{state.value}}
          @label="Label"
          @identifier="identifier"
          @requiredLabel="Required"
          @isInputOnly={{true}}
          @onChange={{fn (mut state.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').doesNotExist();
    assert.dom('[data-test-form-input]').hasAttribute('aria-label', 'Label');
  });
});
