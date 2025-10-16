import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';

export interface Post {
  subject: string;
  body: string;
}

export default class ComponentsFormPowerSelectController extends Controller {
  @tracked value?: Post;

  create = () => {
    const subject = prompt('What is the subject?');
    if (subject) {
      this.value = { subject, body: '' };
    }
  };
}
