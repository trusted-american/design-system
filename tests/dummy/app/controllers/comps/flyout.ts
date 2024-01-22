import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class CompsFlyoutController extends Controller {
  showFlyout = false;

  @action
  close(): void {
    this.showFlyout = false;
  }
}
