import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class CompsPaginationController extends Controller {
  page = 5;

  @action
  next() {}

  @action
  previous() {}
}
