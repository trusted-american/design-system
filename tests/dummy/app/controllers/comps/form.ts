import Controller from '@ember/controller';

export default class CompsFormController extends Controller {
  date: Date | null = new Date();
  file?: unknown;
  invalidFeedback?: string;
  phone?: string | null | undefined;
  radio?: unknown;
  value?: string | null | undefined;
  status?: 'active' | 'inactive';

  options = ['A', 'B', 'C'];
  selected?: string;
  multipleSelected: string[] = [];
}