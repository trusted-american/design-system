import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ComponentsController extends Controller {
  status?: 'active' | 'inactive';

  showFlyout = false;
  showModal = false;

  page = 0;

  @action
  do() {
    console.log('Something');
  }
}
