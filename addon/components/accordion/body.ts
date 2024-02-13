import Component from '@glimmer/component';

export interface AccordionBodySignature {
  Element: HTMLElement;
  Blocks: {
    default: [];
  };
}

export default class AccordionBody extends Component<AccordionBodySignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Accordion::Body': typeof AccordionBody;
    'accordion/body': typeof AccordionBody;
  }
}
