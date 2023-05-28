import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class ComponentsController extends Controller {
  @tracked date: Date | null = new Date();
  file?: unknown;
  invalidFeedback?: string;
  phone?: string | null | undefined;
  radio?: unknown;
  radioBtn?: unknown;
  status?: 'active' | 'inactive';
  value?: string | null | undefined;

  showFlyout = false;
  showModal = false;

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
