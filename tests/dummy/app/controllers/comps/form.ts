import Controller from '@ember/controller';

export default class CompsFormController extends Controller {
  check = false;
  date: Date | null = new Date();
  file?: unknown;
  phone?: string | null | undefined;
  radio?: unknown;
  value?: string | null | undefined;
  status?: 'active' | 'inactive';
  number: number | null = null;
}
