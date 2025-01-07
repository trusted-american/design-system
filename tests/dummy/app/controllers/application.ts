import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class ApplicationController extends Controller {
  @tracked theme: 'light' | 'dark' = 'light';

  @action
  toggleDarkTheme(event: Event): void {
    event.stopPropagation();
    this.isDarkTheme = !this.isDarkTheme;
  }

  get isDarkTheme(): boolean {
    return this.theme === 'dark';
  }

  set isDarkTheme(value: boolean) {
    this.theme = value ? 'dark' : 'light';
  }
}
