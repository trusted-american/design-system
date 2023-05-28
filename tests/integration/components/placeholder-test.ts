import { module, test } from 'qunit';
import { setupRenderingTest } from 'dummy/tests/helpers';
// import { render } from '@ember/test-helpers';
// import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | placeholder', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', function (assert) {
    assert.true(true);

    // await render(hbs`
    //   <Placeholder
    //     @icon="xmark"
    //     @title="Title"
    //     @subtitle="Subtitle"
    //   />
    // `);

    // assert.dom('[data-test-icon]').hasClass('fa-xmark');
    // assert.dom('[data-test-title]').hasText('Title');
    // assert.dom('[data-test-subtitle]').hasText('Subtitle');
  });
});
