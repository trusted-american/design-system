import Controller from '@ember/controller';
import { action } from '@ember/object';

import type { Post } from './power-select';

export default class ComponentsFormPowerSelectMultipleController extends Controller {
  value: Post[] = [];

  @action
  create() {
    alert('Action');
  }
}
