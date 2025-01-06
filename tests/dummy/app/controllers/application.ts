import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class ApplicationController extends Controller {
  @tracked isDarkMode: 'light' | 'dark' = 'light';

  @action
  toggleDarkTheme(event: Event): void {
    event.stopPropagation();
    this.isDarkTheme = !this.isDarkTheme;
  }

  get isDarkTheme(): boolean {
    return this.isDarkMode === 'dark';
  }

  set isDarkTheme(value: boolean) {
    this.isDarkMode = value ? 'dark' : 'light';
  }
}
