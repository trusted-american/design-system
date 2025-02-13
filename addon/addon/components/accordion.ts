import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';

import type { WithBoundArgs } from '@glint/template';
import type AccordionItem from './accordion/item';

export interface AccordionSignature {
  Args: {
    isFlush?: boolean;
    isAlwaysOpen?: boolean;
  };
  Blocks: {
    default: [{ item: WithBoundArgs<typeof AccordionItem, 'accordion'> }];
  };
  Element: HTMLDivElement;
}

export default class Accordion extends Component<AccordionSignature> {
  id = guidFor(this);

  get isAlwaysOpen(): boolean | undefined {
    return this.args.isAlwaysOpen;
  }
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Accordion: typeof Accordion;
  }
}
