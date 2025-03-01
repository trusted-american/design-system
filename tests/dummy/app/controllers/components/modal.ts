import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class ComponentsModalController extends Controller {
  @tracked showModal = false;

  @action
  close(): void {
    this.showModal = false;
  }
}
