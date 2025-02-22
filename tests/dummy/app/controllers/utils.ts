import Controller from '@ember/controller';
import { action } from '@ember/object';
import checkValidity from '@trusted-american/design-system/utils/check-validity';
import fileType from '@trusted-american/design-system/utils/file-type';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';

export default class UtilsController extends Controller {
  // BEGIN-SNIPPET util-check-validity
  @action
  @checkValidity
  submit() {
    alert('Action');
  }
  // END-SNIPPET

  // BEGIN-SNIPPET util-file-type
  type = fileType('file.xlsx');
  // END-SNIPPET

  // BEGIN-SNIPPET util-is-valid-date
  isValid = isValidDate(new Date());
  // END-SNIPPET
}
