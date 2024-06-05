import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';

import type Accordion from '../accordion';
import type AccordionButton from './button';
import type AccordionBody from './body';
import type { WithBoundArgs } from '@glint/template';

export interface AccordionItemSignature {
  Args: {
    accordion: Accordion;
    isOpen?: boolean;
  };
  Blocks: {
    default: [
      {
        button?: WithBoundArgs<typeof AccordionButton, 'item' | 'isOpen'>;
        body?: WithBoundArgs<typeof AccordionBody, never>;
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class AccordionItem extends Component<AccordionItemSignature> {
  id = guidFor(this);
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Accordion::Item': typeof AccordionItem;
    'accordion/item': typeof AccordionItem;
  }
}
