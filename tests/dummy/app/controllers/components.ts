import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ComponentsController extends Controller {
  date: Date | null = new Date();
  file?: unknown;
  invalidFeedback?: string;
  phone?: string | null | undefined;
  radio?: unknown;
  radioBtn?: unknown;
  status?: unknown;
  value?: string | null | undefined;

  users = [
    { email: 'a@example.com', firstName: 'A', lastName: 'A' },
    { email: 'b@example.com', firstName: 'B', lastName: 'B' },
    { email: 'c@example.com', firstName: 'C', lastName: 'C' },
  ];

  @action
  do() {
    console.log('Something');
  }
}
