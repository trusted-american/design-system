import Application from '@ember/application';

import config from 'dummy/config/environment';
import { initialize } from 'dummy/initializers/body-class';
import { module, test } from 'qunit';
import Resolver from 'ember-resolver';
import { run } from '@ember/runloop';

import type { TestContext } from '@ember/test-helpers';

interface Context extends TestContext {
  TestApplication: typeof Application;
  application: Application;
}

module('Unit | Initializer | body-class', function (hooks) {
  hooks.beforeEach(function (this: Context) {
    this.TestApplication = class TestApplication extends Application {
      modulePrefix = config.modulePrefix;
      podModulePrefix = config.podModulePrefix;
      Resolver = Resolver;
    };

    this.TestApplication.initializer({
      name: 'initializer under test',
      initialize,
    });

    this.application = this.TestApplication.create({
      autoboot: false,
    });
  });

  hooks.afterEach(function (this: Context) {
    run(this.application, 'destroy');
  });

  // TODO: Replace this with your real tests.
  test('it works', async function (this: Context, assert) {
    await this.application.boot();

    assert.ok(true);
  });
});
