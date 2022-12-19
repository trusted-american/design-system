import Controller from '@ember/controller';
import isValidDate from '@trusted-american/design-system/utils/is-valid-date';

export default class UtilsController extends Controller {
  get isValid(): boolean {
    return isValidDate(new Date());
  }
}
