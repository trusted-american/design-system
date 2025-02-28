import EmberRouter from '@ember/routing/router';
import config from 'dummy/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('comps', { path: '/components' }, function () {
    this.route('accordion');
    this.route('alert');
    this.route('aside');
    this.route('avatar');
    this.route('badge');
    this.route('banner');
    this.route('basic-table');
    this.route('breadcrumb-trail');
    this.route('button');
    this.route('button-group');
    this.route('button-set');
    this.route('calendar');
    this.route('card');
    this.route('close-button');
    this.route('collapse');
    this.route('copy');
    this.route('dropdown');
    this.route('external-link');
    this.route('file-type');
    this.route('flyout');
    this.route('form', function () {
      this.route('check');
      this.route('date-input');
      this.route('file-dropzone');
    });
    this.route('heading');
    this.route('icon');
    this.route('list-attributes');
    this.route('list-filter');
    this.route('list-group');
    this.route('list-sort');
    this.route('main');
    this.route('modal');
    this.route('nav');
    this.route('pagination');
    this.route('placeholder');
    this.route('progress');
    this.route('property-list');
    this.route('ratio');
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
  this.route('guides', function () {
    this.route('introduction');
  });
  this.route('list');
  this.route('detail');
  this.route('form');
  this.route('not-found', { path: '/*path' });
});
