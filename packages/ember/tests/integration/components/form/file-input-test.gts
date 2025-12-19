import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
import { render, triggerEvent } from '@ember/test-helpers';
import FormFileInput from '@trusted-american/ember/components/form/file-input';
import { tracked } from '@glimmer/tracking';
import { fn } from '@ember/helper';

module('Integration | Component | form/file-input', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    class State {
      @tracked file?: File;
    }
    const state = new State();

    await render(
      <template>
        <FormFileInput
          @label="Label"
          @identifier="identifier"
          @isRequired={{true}}
          @help="Help"
          @invalidLabel="Invalid feedback"
          @requiredLabel="Required"
          @onChange={{fn (mut state.file)}}
        />
      </template>,
    );

    assert.dom('[data-test-form-label]').exists();
    assert.dom('[data-test-form-file-input]').hasAttribute('id', 'identifier');
    assert.dom('[data-test-form-file-input]').isRequired();
    assert.dom('[data-test-form-help]').exists();
    assert.dom('[data-test-form-feedback]').exists();

    await triggerEvent('[data-test-form-file-input]', 'change', {
      files: [new File(['Ember Rules!'], 'ember-rules.txt')],
    });

    assert.true(state.file instanceof File);
  });
});
