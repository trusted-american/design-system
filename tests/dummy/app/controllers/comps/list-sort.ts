import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class CompsListSortController extends Controller {
  @tracked
  sortBy: 'createdAt' | 'modifiedAt' = 'createdAt';
  @tracked
  sortAscending = false;

  options = [
    { label: 'Created DatesortAscendingeatedAt' },
    { label: 'Modified Date', value: 'modifiedAt' },
  ];

  @action
  onChange(sortBy: 'createdAt' | 'modifiedAt', sortAscending: boolean) {
    this.sortBy = sortBy;
    this.sortAscending = sortAscending;
  }
}
