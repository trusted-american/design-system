import type { TOC } from '@ember/component/template-only';

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

const BasicTable: TOC<BasicTableSignature> = <template>
  <table
    class="table {{if @isSmall 'table-sm'}} {{if @isBordered 'table-bordered'}}"
    data-test-basic-table
    ...attributes
  >
    {{yield}}
  </table>
</template>;

export default BasicTable;
