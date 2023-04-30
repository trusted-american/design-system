import Component from '@glimmer/component';
import BsCard from 'ember-simple-bootstrap/components/bs/card';

export interface StatCardSignature {
  Element: HTMLDivElement;
  Args: {
    key: string;
    value: string | number | null | undefined;
  };
}

export default class StatCard extends Component<StatCardSignature> {
  <template>
    <BsCard class='border-0 bg-light mb-4' ...attributes as |card|>
      <card.body>
        <h6 class='card-title fw-normal text-secondary'>
          {{@key}}
        </h6>
        <h5 class='mb-0'>
          {{#if @value}}
            {{@value}}
          {{else}}
            &mdash;
          {{/if}}
        </h5>
      </card.body>
    </BsCard>
  </template>
}

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    StatCard: typeof StatCard;
  }
}
