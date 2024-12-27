import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

import type { User } from '../../routes/comps/table';

export default class CompsTableController extends Controller {
  declare model: User[];

  @tracked page = 0;

  @action
  do() {
    console.log('Something');
  }
}
