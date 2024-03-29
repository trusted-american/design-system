import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';

import type { WithBoundArgs } from '@glint/template';
import type AccordionItem from './accordion/item';

export interface AccordionComponentSignature {
  Args: {
    flush?: boolean;
    alwaysOpen?: boolean;
  };
  Blocks: {
    default: [{ item: WithBoundArgs<typeof AccordionItem, 'accordion'> }];
  };
  Element: HTMLDivElement;
}

export default class Accordion extends Component<AccordionComponentSignature> {
  get id(): string {
    return guidFor(this);
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Accordion: typeof Accordion;
  }
}
