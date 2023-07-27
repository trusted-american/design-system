import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class CompsListFilterController extends Controller {
  status?: 'active' | 'inactive';

  @action
  do() {
    console.log('Something');
  }
}
