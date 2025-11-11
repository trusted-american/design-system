import type { TOC } from '@ember/component/template-only';

export interface AccordionBodySignature {
  Blocks: {
    default: [];
  };
  Element: HTMLDivElement;
}

const AccordionBody: TOC<AccordionBodySignature> = <template>
  <div class="accordion-body" ...attributes>
    {{yield}}
  </div>
</template>;

export default AccordionBody;
