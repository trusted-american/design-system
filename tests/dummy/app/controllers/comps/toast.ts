import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ComponentsToastController extends Controller {
  @action
  do() {
    console.log('Something');
  }
}
