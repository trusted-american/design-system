import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class ComponentsController extends Controller {
  date: Date | null = new Date();
  file?: unknown;
  invalidFeedback?: string;
  phone?: string | null | undefined;
  radio?: unknown;
  radioBtn?: unknown;
  status?: 'active' | 'inactive';
  value?: string | null | undefined;

  showFlyout = false;
  showModal = false;

  page = 0;

  users = [
    { email: 'a@example.com', firstName: 'A', lastName: 'A' },
    { email: 'b@example.com', firstName: 'B', lastName: 'B' },
    { email: 'c@example.com', firstName: 'C', lastName: 'C' },
  ];

  events = [
    { title: 'Event 1', start: new Date() },
    { title: 'Event 2', start: new Date(), backgroundColor: '#5af542' },
  ];
  event?: { title: string; start: Date };

  @action
  do() {
    console.log('Something');
  }
}
