import { hash } from '@ember/helper';
import { guidFor } from '@ember/object/internals';
import Component from '@glimmer/component';
import type { WithBoundArgs } from '@glint/template';
import AccordionItem from './accordion/item';

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

  <template>
    {{! TODO: if @isFlush 'accordion-flush'}}
    <div
      id="accordion-collapse"
      data-accordion="collapse"
      id={{this.id}}
      data-test-accordion
      ...attributes
    >
      {{yield (hash item=(component AccordionItem accordion=this))}}
    </div>
  </template>
}
