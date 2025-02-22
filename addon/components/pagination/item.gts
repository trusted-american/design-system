import Component from '@glimmer/component';
import { on } from '@ember/modifier';
import { inc } from '@nullvoxpopuli/ember-composable-helpers';

export interface PaginationItemSignature {
  Args: {
    page?: number;
    index: number;
    onClick: (event: Event) => void;
  };
}

export default class PaginationItem extends Component<PaginationItemSignature> {
  <template>
    <li class="page-item {{if (eq @page @index) 'active'}}">
      <a class="page-link" href="#" {{on "click" @onClick}}>
        {{inc @index}}
      </a>
    </li>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Pagination::Item': typeof PaginationItem;
  }
}
