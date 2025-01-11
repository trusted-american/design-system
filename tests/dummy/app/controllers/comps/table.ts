import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

import type { User } from '../../routes/comps/table';

export default class CompsTableController extends Controller {
  declare model: User[];

  @tracked page = 0;

  get _page(): User[] {
    const pageSize = 20;
    const start = this.page * pageSize;
    const end = start + pageSize;
    return this.model.slice(start, end);
  }

  @action
  do() {
    console.log('Something');
  }
}
