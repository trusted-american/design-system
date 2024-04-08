import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

import type { DateRangeQueryParam } from '@trusted-american/design-system/components/list-filter';

export default class CompsListFilterController extends Controller {
  @tracked status?: 'active' | 'inactive';
  @tracked type: ('primary' | 'secondary')[] = [];
  @tracked tag?: string;
  @tracked createdAt: DateRangeQueryParam = [];

  @action
  change(key: string, value: unknown): void {
    this[key as keyof this] = value as this[keyof this];
  }
}
