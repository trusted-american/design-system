import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';

export default class ComponentsFormHtmlInputController extends Controller {
  @tracked value: string | null = '<p>Hello World!</p>';
}
