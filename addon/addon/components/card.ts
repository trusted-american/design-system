import Component from '@glimmer/component';

import type CardHeader from './card/header';
import type CardBody from './card/body';
import type CardFooter from './card/footer';
import type { WithBoundArgs } from '@glint/template';

export interface CardSignature {
  Blocks: {
    default: [
      {
        header: WithBoundArgs<typeof CardHeader, never>;
        body: WithBoundArgs<typeof CardBody, never>;
        footer: WithBoundArgs<typeof CardFooter, never>;
      },
    ];
  };
  Element: HTMLDivElement;
}

export default class Card extends Component<CardSignature> {}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Card: typeof Card;
  }
}
