import Component from '@glimmer/component';
import CardHeader from './card/header';
import CardBody from './card/body';
import CardFooter from './card/footer';
import { hash } from '@ember/helper';

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

export default class Card extends Component<CardSignature> {
  <template>
    <div class="card" data-test-card ...attributes>
      {{yield (hash header=CardHeader body=CardBody footer=CardFooter)}}
    </div>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Card: typeof Card;
  }
}
