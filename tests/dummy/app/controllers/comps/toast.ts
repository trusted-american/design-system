import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class CompsToastController extends Controller {
  @action
  close() {
    alert('Close');
  }
}
