import type { TOC } from '@ember/component/template-only';
import { faChevronDown } from '@fortawesome/free-solid-svg-icons';
import collapse from '../../modifiers/collapse';
import Icon from '../icon';
import type AccordionItem from './item';

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
  {{! TODO: unless @isOpen 'collapsed'}}
  <button
    type="button"
    class="flex items-center justify-between w-full p-5 font-medium rtl:text-right text-gray-500 border border-b-0 border-gray-200 rounded-t-xl focus:ring-4 focus:ring-gray-200 hover:bg-gray-100 gap-3"
    data-accordion-target="#accordion-collapse-body-1"
    aria-expanded="true"
    aria-controls="accordion-collapse-body-1"
    {{collapse @item.id}}
    ...attributes
  >
    <span>{{yield}}</span>
    <Icon @icon={{faChevronDown}} class="shrink-0" />
  </button>
</template>;

export default AccordionButton;
