import Component from '@glimmer/component';
import { guidFor } from '@ember/object/internals';
import { hash } from '@ember/helper';
import AccordionItem from './accordion/item';

import type { WithBoundArgs } from '@glint/template';

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

  <template>
    <div
      class="accordion {{if @isFlush 'accordion-flush'}}"
      id={{this.id}}
      data-test-accordion
      ...attributes
    >
      {{yield (hash item=(component AccordionItem accordion=this))}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Accordion: typeof Accordion;
  }
}
