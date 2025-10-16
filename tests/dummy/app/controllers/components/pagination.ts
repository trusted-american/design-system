import Controller from '@ember/controller';

export default class ComponentsPaginationController extends Controller {
  page = 5;

  next = () => {
    alert('Action');
  };

  previous = () => {
    alert('Action');
  };
}
