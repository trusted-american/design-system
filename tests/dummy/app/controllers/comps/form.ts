import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class CompsFormController extends Controller {
  check = false;
  date: Date | null = new Date();
  file?: unknown;
  htmlValue: string | null = null;
  phone?: string | null | undefined;
  radio?: unknown;
  value?: string | null | undefined;
  status?: 'active' | 'inactive';
  number: number | null = null;

  @action
  create() {}
}
