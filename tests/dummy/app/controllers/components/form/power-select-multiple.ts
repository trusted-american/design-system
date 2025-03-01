import Controller from '@ember/controller';

import type { Post } from './power-select';

export default class ComponentsFormPowerSelectMultipleController extends Controller {
  value: Post[] = [];
}
