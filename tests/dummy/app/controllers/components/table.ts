import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import type { User } from '../../routes/components/table';

export default class ComponentsTableController extends Controller {
  declare model: User[];

  @tracked page = 0;

  get _page(): User[] {
    const pageSize = 20;
    const start = this.page * pageSize;
    const end = start + pageSize;
    return this.model.slice(start, end);
  }

  @action
  next() {
    alert('Next');
  }

  @action
  previous() {
    alert('Previous');
  }
}
