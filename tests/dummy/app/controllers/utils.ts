import Controller from '@ember/controller';
import fileType from '@trusted-american/design-system/utils/file-type';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';

export default class UtilsController extends Controller {
  // BEGIN-SNIPPET util-file-type
  type = fileType('file.xlsx');
  // END-SNIPPET

  // BEGIN-SNIPPET util-is-valid-date
  isValid = isValidDate(new Date());
  // END-SNIPPET
}
