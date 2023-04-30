import Component from '@glimmer/component';
import BsCard from 'ember-simple-bootstrap/components/bs/card';

export interface CardSignature {
  Element: HTMLDivElement;
  Args: {
    title?: string;
  };
  Blocks: {
    default: [];
    header: [];
    padded: [];
  };
}

export default class Card extends Component<CardSignature> {
  <template>
    <BsCard class='mb-4' ...attributes as |card|>
      {{#if @title}}
        <card.header
          @title={{@title}}
          class='bg-white pe-2'
          {{! template-lint-disable no-inline-styles }}
          style='min-height: 3.465rem;'
        >
          {{yield to='header'}}
        </card.header>
      {{/if}}
      {{#if (has-block 'padded')}}
        <card.body>
          {{yield to='padded'}}
        </card.body>
      {{/if}}
      {{yield}}
    </BsCard>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    Card: typeof Card;
  }
}
