import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';

export default class ComponentsFlyoutController extends Controller {
  @tracked showFlyout = false;

  close = () => {
    this.showFlyout = false;
  };
}
