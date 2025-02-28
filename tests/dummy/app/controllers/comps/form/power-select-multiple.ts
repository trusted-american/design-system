import Controller from '@ember/controller';

import type { Post } from './power-select';

export default class CompsFormPowerSelectMultipleController extends Controller {
  value: Post[] = [];
}
