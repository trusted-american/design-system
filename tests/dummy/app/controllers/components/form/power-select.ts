import Controller from '@ember/controller';

export interface Post {
  subject: string;
  body: string;
}

export default class ComponentsFormPowerSelectController extends Controller {
  value?: Post;
}
