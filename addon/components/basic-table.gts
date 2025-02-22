import Component from '@glimmer/component';

export interface BasicTableSignature {
  Args: {
    isSmall?: boolean;
    isBordered?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLTableElement;
}

export default class BasicTable extends Component<BasicTableSignature> {
  <template>
    <table
      class="table
        {{if @isSmall 'table-sm'}}
        {{if @isBordered 'table-bordered'}}"
      data-test-basic-table
      ...attributes
    >
      {{yield}}
    </table>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    BasicTable: typeof BasicTable;
  }
}
