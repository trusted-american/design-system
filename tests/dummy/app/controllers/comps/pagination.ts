import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class CompsPaginationController extends Controller {
  page1 = 5;
  page2 = 0;

  @action
  next() {}

  @action
  previous() {}
}
