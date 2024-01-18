import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class CompsListFilterController extends Controller {
  @tracked status?: 'active' | 'inactive';

  @action
  change(key: keyof this, value: this[keyof this]): void {
    this[key] = value;
  }
}
