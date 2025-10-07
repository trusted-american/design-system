import Controller from '@ember/controller';

export default class ComponentsAlertController extends Controller {
  close = () => {
    alert('Action');
  };
}
