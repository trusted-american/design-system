import type { TOC } from '@ember/component/template-only';

export interface CollapseSignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const Collapse: TOC<CollapseSignature> = <template>
  <div class="hidden" data-test-collapse ...attributes>
    {{yield}}
  </div>
</template>;

export default Collapse;
