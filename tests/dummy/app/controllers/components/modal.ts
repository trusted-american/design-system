import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class ComponentsModalController extends Controller {
  @tracked showModal = false;

  options = [
    { name: 'Alice' },
    { name: 'Bob' },
    { name: 'Charlie' },
    { name: 'Diana' },
    { name: 'Eve' },
    { name: 'Frank' },
    { name: 'Grace' },
    { name: 'Heidi' },
    { name: 'Ivan' },
    { name: 'Judy' },
    { name: 'Kevin' },
    { name: 'Lauren' },
    { name: 'Mallory' },
    { name: 'Niaj' },
    { name: 'Olivia' },
    { name: 'Peggy' },
  ];
  selected?: { name: string };

  @action
  close(): void {
    this.showModal = false;
  }
}
