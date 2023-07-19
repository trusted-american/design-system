import EmberRouter from '@ember/routing/router';
import config from 'dummy/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('components', function () {
    this.route('alert');
    this.route('aside');
    this.route('avatar');
    this.route('badge');
    this.route('breadcrumb-trail');
    this.route('button');
    this.route('button-set');
    this.route('calendar');
    this.route('card');
    this.route('close-button');
    this.route('dropdown');
    this.route('external-link');
    this.route('file-type');
    this.route('flyout');
    this.route('form');
    this.route('heading');
    this.route('list-filter');
    this.route('list-group');
    this.route('loader');
    this.route('main');
    this.route('modal');
    this.route('nav');
    this.route('pagination');
    this.route('placeholder');
    this.route('property-list');
    this.route('skeleton');
    this.route('stat-card');
    this.route('subheading');
    this.route('table');
    this.route('toast');
  });
  this.route('helpers');
  this.route('utils');
  this.route('example');
  this.route('not-found', { path: '/*path' });
});
