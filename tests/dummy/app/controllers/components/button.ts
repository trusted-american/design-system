import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ComponentsButtonController extends Controller {
  @action
  click() {
    alert('Action');
  }
}
