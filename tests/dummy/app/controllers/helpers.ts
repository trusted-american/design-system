import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';

import type { Theme } from '@trusted-american/design-system/helpers/theme';

export default class HelpersController extends Controller {
  date = new Date();

  @tracked theme: Theme = 'light';

  get isDarkTheme(): boolean {
    return this.theme === 'dark';
  }
  set isDarkTheme(value: boolean) {
    this.theme = value ? 'dark' : 'light';
  }
}
