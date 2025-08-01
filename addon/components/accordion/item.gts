import { concat, hash } from '@ember/helper';
import { guidFor } from '@ember/object/internals';
import Component from '@glimmer/component';
import type { WithBoundArgs } from '@glint/template';
import type Accordion from '../accordion';
import AccordionBody from './body';
import AccordionButton from './button';

export interface AccordionItemSignature {
  Args: {
    accordion: Accordion;
    isOpen?: boolean;
  };
  Blocks: {
    default: [
      {
        button?: WithBoundArgs<typeof AccordionButton, 'item' | 'isOpen'>;
        body?: typeof AccordionBody;
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class AccordionItem extends Component<AccordionItemSignature> {
  id = guidFor(this);

  <template>
    <div class="accordion-item" ...attributes>
      <h2 class="accordion-header">
        {{yield
          (hash button=(component AccordionButton item=this isOpen=@isOpen))
        }}
      </h2>
      <div
        class="accordion-collapse collapse {{if @isOpen 'show'}}"
        id={{this.id}}
        data-bs-parent={{unless
          @accordion.args.isAlwaysOpen
          (concat "#" @accordion.id)
        }}
      >
        {{yield (hash body=AccordionBody)}}
      </div>
    </div>
  </template>
}
