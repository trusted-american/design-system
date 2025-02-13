import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class CompsFlyoutController extends Controller {
  @tracked showFlyout = false;

  @action
  close(): void {
    this.showFlyout = false;
  }
}
