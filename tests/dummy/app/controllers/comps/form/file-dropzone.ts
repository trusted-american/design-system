import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class CompsFormFileDropzoneController extends Controller {
  @tracked value: File[] = [];

  @action
  create(file: File) {
    this.value = [...this.value, file];
  }
}
