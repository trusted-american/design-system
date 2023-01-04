import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ExampleController extends Controller {
  search = '';

  @action
  do() {
    console.log('Something');
  }
}
