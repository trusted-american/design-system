import EmberRouter from '@ember/routing/router';
import config from 'dummy/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('comps', function () {
    this.route('accordion');
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
    this.route('collapse');
    this.route('copy-button');
    this.route('dropdown');
    this.route('external-link');
    this.route('file-type');
    this.route('flyout');
    this.route('form');
    this.route('heading');
    this.route('icon');
    this.route('list-filter');
    this.route('list-group');
    this.route('main');
    this.route('modal');
    this.route('nav');
    this.route('pagination');
    this.route('placeholder');
    this.route('progress');
    this.route('property-list');
    this.route('skeleton');
    this.route('spinner');
    this.route('stat-card');
    this.route('subheading');
    this.route('table');
    this.route('toast');
  });
  this.route('helpers');
  this.route('modifiers');
  this.route('utils');
  this.route('example');
  this.route('detail');
  this.route('not-found', { path: '/*path' });
});
