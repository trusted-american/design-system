import Controller from '@ember/controller';
import { action } from '@ember/object';
import checkValidity from '@trusted-american/design-system/utils/check-validity';

export default class FormController extends Controller {
  value?: string;
  check = false;

  @action
  @checkValidity
  submit() {
    alert('Success');
  }
}
