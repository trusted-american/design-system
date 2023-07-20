import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class CompsTableController extends Controller {
  declare model: { email: string; firstName: string; lastName: string }[];

  @action
  do() {
    console.log('Something');
  }
}
