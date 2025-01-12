import Controller from '@ember/controller';
import { action } from '@ember/object';

export default class DetailController extends Controller {
  value?: string;

  @action
  submit(event: Event) {
    event.preventDefault();

    const { target } = event;
    if (!(target instanceof HTMLFormElement)) {
      throw new Error();
    }

    if (!target.checkValidity()) {
      target.classList.add('was-validated');
      return;
    } else {
      target.classList.remove('was-validated');
    }

    console.log('Success');
  }
}
