import type { TOC } from '@ember/component/template-only';

export interface AccordionBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const AccordionBody: TOC<AccordionBodySignature> = <template>
  <div class="p-5 border border-b-0 border-gray-200" ...attributes>
    {{yield}}
  </div>
</template>;

export default AccordionBody;
