import Controller from '@ember/controller';
import fileType from '@trusted-american/design-system/utils/file-type';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';

export default class UtilsController extends Controller {
  type = fileType('xlsx');

  get isValid(): boolean {
    return isValidDate(new Date());
  }
}
