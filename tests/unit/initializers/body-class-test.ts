import Application from '@ember/application';

import config from 'dummy/config/environment';
import { initialize } from '@trusted-american/design-system/initializers/body-class';
import { module, test } from 'qunit';
import Resolver from 'ember-resolver';
import { run } from '@ember/runloop';
import Route from '@ember/routing/route';

import type { TestContext } from '@ember/test-helpers';
import type Transition from '@ember/routing/transition';

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
    // eslint-disable-next-line ember/no-runloop
    run(this.application, 'destroy');
  });

  test('it works', async function (this: Context, assert) {
    await this.application.boot();

    const route = Route.create({
      routeName: 'application',
    });

    route.activate({} as Transition);

    assert.true(document.body.classList.contains('route-application'));

    route.deactivate();

    assert.false(document.body.classList.contains('route-application'));
  });
});
