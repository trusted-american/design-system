import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';

export default class ModifiersController extends Controller {
  timeout?: number;

  @tracked isClicked = false;

  click = () => {
    this.isClicked = true;

    clearTimeout(this.timeout);

    this.timeout = setTimeout(() => {
      this.isClicked = false;
    }, 5000);
  };
}
