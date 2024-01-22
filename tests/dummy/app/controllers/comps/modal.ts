import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class CompsModalController extends Controller {
  showModal = false;

  @action
  close(): void {
    this.showModal = false;
  }
}
