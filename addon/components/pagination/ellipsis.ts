import Component from '@glimmer/component';

export default class PaginationEllipsis extends Component {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Pagination::Ellipsis': typeof PaginationEllipsis;
  }
}
