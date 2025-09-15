import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export interface Post {
  subject: string;
  body: string;
}

export default class ComponentsFormPowerSelectController extends Controller {
  @tracked value?: Post;

  @action
  create() {
    const subject = prompt('What is the subject?');
    if (subject) {
      this.value = { subject, body: '' };
    }
  }
}
