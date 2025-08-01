import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class ComponentsFlyoutController extends Controller {
  @tracked showFlyout = false;

  @action
  close(): void {
    this.showFlyout = false;
  }
}
