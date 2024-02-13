import Component from '@glimmer/component';

import type AccordionItem from './item';

export interface AccordionButtonSignature {
  Element: HTMLElement;
  Args: {
    item: AccordionItem;
    show?: boolean;
  };
  Blocks: {
    default: [];
  };
}

export default class AccordionButton extends Component<AccordionButtonSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Accordion::Button': typeof AccordionButton;
    'accordion/button': typeof AccordionButton;
  }
}
