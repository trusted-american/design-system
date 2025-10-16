import Controller from '@ember/controller';

export default class ListController extends Controller {
  search = '';

  users = [
    { email: 'a@example.com', firstName: 'A', lastName: 'A' },
    { email: 'b@example.com', firstName: 'B', lastName: 'B' },
    { email: 'c@example.com', firstName: 'C', lastName: 'C' },
  ];

  click = () => {
    alert('Action');
  };
}
