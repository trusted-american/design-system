import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ComponentsAlertController extends Controller {
  @action
  close() {
    alert('Action');
  }
}
