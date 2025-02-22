import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, fillIn, type TestContext, click } from '@ember/test-helpers';
import { FormInput } from '@trusted-american/design-system';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';

import type { FormInputSignature } from '@trusted-american/design-system/components/form/input';

type Context = FormInputSignature['Args'] &
  TestContext & {
    submit: (event: Event) => void;
  };

module('Integration | Component | form/input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (this: Context, assert) {
    this.value = '';

    await render<Context>(
      <template>
        <FormInput
          @value={{this.value}}
          @type="text"
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidFeedback="Invalid feedback"
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('[data-test-form-input]').hasAttribute('id', 'identifier');
    assert.dom('[data-test-form-input]').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-error]').exists();
  });

  test('it defaults to text type', async function (this: Context, assert) {
    this.value = '';

    await render<Context>(
      <template>
        <FormInput
          @value={{this.value}}
          @label=""
          @identifier=""
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').hasAttribute('type', 'text');
  });

  test('it loads initial value', async function (this: Context, assert) {
    this.value = 'Value';

    await render<Context>(
      <template>
        <FormInput
          @value={{this.value}}
          @label=""
          @identifier=""
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-input]').hasValue('Value');
  });

  test('it updates value', async function (this: Context, assert) {
    this.value = '';

    await render<Context>(
      <template>
        <FormInput
          @value={{this.value}}
          @label=""
          @identifier=""
          @onChange={{fn (mut this.value)}}
        />
      </template>,
    );

    await fillIn('[data-test-form-input]', 'test');

    assert.strictEqual(this.value, 'test');
  });

  test('invalidFeedback works', async function (this: Context, assert) {
    this.value = '';
    this.submit = (event: Event) => {
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

    await render<Context>(
      <template>
        <form novalidate {{on "submit" this.submit}}>
          <FormInput
            @value={{this.value}}
            @label=""
            @identifier=""
            @isRequired={{true}}
            @onChange={{fn (mut this.value)}}
            @invalidFeedback="Wrong"
          />
          <button type="submit" data-test-submit>Submit</button>
        </form>
      </template>,
    );

    assert.dom('form div').hasStyle({ height: '38px' });
    assert.dom('form').doesNotHaveClass('was-validated');
    await click('[data-test-submit]');
    assert.dom('form').hasClass('was-validated');
    assert.dom('[data-test-form-error]').hasText('Wrong');
    assert.dom('form div').hasStyle({ height: '63px' });
  });
});
