import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import type { Theme } from '@trusted-american/design-system/helpers/theme';

export default class ApplicationController extends Controller {
  @tracked theme: Theme = 'light';

  @tracked isCollapsed = false;
  @tracked query = '';

  @action
  expand() {
    this.isCollapsed = false;
  }

  get isDarkTheme(): boolean {
    return this.theme === 'dark';
  }
  set isDarkTheme(value: boolean) {
    this.theme = value ? 'dark' : 'light';
  }
}
