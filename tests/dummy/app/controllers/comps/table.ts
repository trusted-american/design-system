import Controller from '@ember/controller';
import { action } from '@ember/object';

import type { User } from '../../routes/comps/table';

export default class CompsTableController extends Controller {
  declare model: User[];

  @action
  do() {
    console.log('Something');
  }
}
