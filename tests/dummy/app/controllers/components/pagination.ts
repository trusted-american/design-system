import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ComponentsPaginationController extends Controller {
  page = 5;

  @action
  next() {
    alert('Action');
  }

  @action
  previous() {
    alert('Action');
  }
}
