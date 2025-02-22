import Component from '@glimmer/component';
import collapse from '../../modifiers/collapse';

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

export default class AccordionButton extends Component<AccordionButtonSignature> {
  <template>
    <button
      type="button"
      class="accordion-button {{unless @isOpen 'collapsed'}}"
      {{collapse @item.id}}
      ...attributes
    >
      {{yield}}
    </button>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Accordion::Button': typeof AccordionButton;
    'accordion/button': typeof AccordionButton;
  }
}
