import Component from '@glimmer/component';

export default class PaginationEllipsis extends Component {
  <template>
    <li class="page-item">
      <div class="page-link" disabled>
        …
      </div>
    </li>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Pagination::Ellipsis': typeof PaginationEllipsis;
  }
}
