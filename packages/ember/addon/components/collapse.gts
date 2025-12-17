import type { TOC } from '@ember/component/template-only';

export interface CollapseSignature {
  Args: {
    isHorizontal?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const Collapse: TOC<CollapseSignature> = <template>
  <div
    class="collapse {{if @isHorizontal 'collapse-horizontal'}}"
    data-test-collapse
    ...attributes
  >
    {{yield}}
  </div>
</template>;

export default Collapse;
