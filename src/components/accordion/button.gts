import type { TOC } from '@ember/component/template-only';
import collapse from '../../modifiers/collapse.ts';
import type AccordionItem from './item.gts';

export interface AccordionButtonSignature {
  Args: {
    item: AccordionItem;
    isOpen?: boolean;
  };
  Blocks: {
    default: [];
  };
  Element: HTMLButtonElement;
}

const AccordionButton: TOC<AccordionButtonSignature> = <template>
  <button
    type="button"
    class="accordion-button {{unless @isOpen 'collapsed'}}"
    {{collapse @item.id}}
    ...attributes
  >
    {{yield}}
  </button>
</template>;

export default AccordionButton;
