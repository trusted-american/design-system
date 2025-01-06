import Controller from '@ember/controller';
import { action } from '@ember/object';
import localStorage from 'ember-local-storage-decorator';

export default class ApplicationController extends Controller {
  @localStorage isDarkMode?: 'light' | 'dark';

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
