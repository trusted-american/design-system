import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';

import type { WithBoundArgs } from '@glint/template';
import type AccordionItem from './accordion/item';

export interface AccordionSignature {
  Args: {
    flush?: boolean;
    alwaysOpen?: boolean;
  };
  Blocks: {
    default: [{ item: WithBoundArgs<typeof AccordionItem, 'accordion'> }];
  };
  Element: HTMLDivElement;
}

export default class Accordion extends Component<AccordionSignature> {
  id = guidFor(this);

  get alwaysOpen(): boolean | undefined {
    return this.args.alwaysOpen;
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Accordion: typeof Accordion;
  }
}
