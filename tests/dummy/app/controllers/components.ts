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
    // { email: 'd@example.com', firstName: 'D', lastName: 'D' },
    // { email: 'e@example.com', firstName: 'E', lastName: 'E' },
    // { email: 'f@example.com', firstName: 'F', lastName: 'F' },
    // { email: 'g@example.com', firstName: 'G', lastName: 'G' },
    // { email: 'h@example.com', firstName: 'H', lastName: 'H' },
    // { email: 'i@example.com', firstName: 'I', lastName: 'I' },
  ];

  @action
  do() {
    console.log('Something');
  }
}
