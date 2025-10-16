import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';

export default class ComponentsFormFileDropzoneController extends Controller {
  @tracked value: File[] = [];

  create = (file: File) => {
    this.value = [...this.value, file];
  };
}
