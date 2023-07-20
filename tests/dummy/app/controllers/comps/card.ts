import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ComponentsCardController extends Controller {
  @action
  do() {
    console.log('Something');
  }
}
